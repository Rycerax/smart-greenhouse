import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_greenhouse/managers/device_manager.dart';
import 'package:smart_greenhouse/protos/greenhouse.pb.dart';
import 'package:smart_greenhouse/socket_client.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final client = SocketClient(host: '34.227.14.119', port: 50002);
  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (_) {
      Command cmd = Command(command: 'GET', name: 'Temperature Sensor');
      client.receiveData(cmd);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<DeviceManager>(context);
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
