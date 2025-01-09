import 'package:flutter/material.dart';
import 'package:grpc/grpc_web.dart';
import 'package:provider/provider.dart';
import 'package:smart_greenhouse/managers/device_manager.dart';
import 'package:smart_greenhouse/protos/greenhouse.pb.dart';
import 'package:smart_greenhouse/socket_client.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  


  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<DeviceManager>(context);

    final client = SocketClient(host: '127.0.0.1', port: 50000);

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(title: Text('Sensores e Atuadores')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: manager.sensores.length,
              itemBuilder: (context, index) {
                final sensor = manager.sensores[index];
                return ListTile(
                  title: Text(sensor.name),
                  subtitle: Text('Status: ${sensor.status}'),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: manager.atuadores.length,
              itemBuilder: (context, index) {
                final atuador = manager.atuadores[index];
                return ListTile(
                  title: Text(atuador.name),
                  subtitle: Text('State: ${atuador.state}'),
                  trailing: Switch(
                    value: atuador.state == "On",
                    onChanged: (value) {
                      manager.toggleActuatorState(atuador.id);
                    },
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