import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_greenhouse/atuador.dart';
import 'package:smart_greenhouse/managers/device_manager.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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