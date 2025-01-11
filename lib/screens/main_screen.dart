import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_greenhouse/atuador.dart';
import 'package:smart_greenhouse/managers/device_manager.dart';
import 'package:smart_greenhouse/protos/greenhouse.pb.dart';
import 'package:smart_greenhouse/sensor.dart';
import 'package:smart_greenhouse/socket_client.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final client = SocketClient(host: '3.84.236.207', port: 50002);
  DeviceManager? manager;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    manager = Provider.of<DeviceManager>(context);
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(title: Text('Sensores e Atuadores')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: manager!.sensores.length,
              itemBuilder: (context, index) {
                final sensor = manager!.sensores[index];
                return ListTile(
                  title: Text(sensor.name),
                  subtitle: Text(
                    'Value: ${sensor.value} Status: ${sensor.status}',
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Command cmd = Command(command: 'GET');

                client.receiveData(cmd).then((lst) {
                  // Criar listas de sensores e atuadores a partir de DeviceStatus
                  List<Sensor> sen =
                      lst
                          .where(
                            (device) => device.type == 'Sensor',
                          ) // Filtrar apenas sensores
                          .map(
                            (device) => Sensor(
                              id: device.name,
                              name: device.name,
                              status: device.status,
                              value:
                                  '${device.value.toStringAsPrecision(4)} ${device.unit}',
                            ),
                          )
                          .toList();

                  List<Atuador> atu =
                      lst
                          .where(
                            (device) => device.type == 'Actuator',
                          ) // Filtrar apenas atuadores
                          .map(
                            (device) => Atuador(
                              id: device.name,
                              name: device.name,
                              state: device.status,
                              unit: device.unit,
                            ),
                          )
                          .toList();

                  // Atualizar o DeviceManager
                  manager?.updateSensores(sen);
                  manager?.updateAtuadores(atu);
                });
              },
              child: Text('Update Info'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: manager?.atuadores.length,
              itemBuilder: (context, index) {
                final atuador = manager?.atuadores[index];
                final TextEditingController textController =
                    TextEditingController();

                return ListTile(
                  title: Text('${atuador!.name} (${atuador.unit})'),
                  subtitle: Text('State: ${atuador.state}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Caixa de texto para inserir o valor
                      SizedBox(
                        width: 50,
                        child: TextField(
                          controller: textController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Value',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 5),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      // Botão para enviar o valor
                      ElevatedButton(
                        onPressed: () {
                          final inputValue = double.tryParse(
                            textController.text,
                          );
                          if (inputValue != null) {
                            // Enviar o comando com o valor digitado
                            Command cmd = Command(
                              command: 'SET',
                              name: atuador.name,
                              value: inputValue,
                            );
                            client.receiveData(
                              cmd,
                            ); // Envia o comando ao servidor
                            print('Comando enviado: $cmd');
                          } else {
                            print('Por favor, insira um valor válido.');
                          }
                        },
                        child: Text('Set'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
