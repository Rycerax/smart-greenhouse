import 'package:flutter/material.dart';
import 'package:smart_greenhouse/atuador.dart';
import 'package:smart_greenhouse/sensor.dart';

class DeviceManager extends ChangeNotifier {
  List<Sensor> sensores = [];
  List<Atuador> atuadores = [];

  void updateSensores(List<Sensor> newSensores){
    sensores = newSensores;
    notifyListeners();
  }

  void updateAtuadores(List<Atuador> newAtuadores){
    atuadores = newAtuadores;
    notifyListeners();
  }

  void updateSensorStatus(String id, String newStatus){
    final sensor = sensores.firstWhere((s) => s.id == id);
    sensor.updateStatus(newStatus);
    notifyListeners();
  }

  void toggleActuatorState(String id) {
    final atuador =  atuadores.firstWhere((a) => a.id == id);
    atuador.toggleState();
    notifyListeners();
  }

  void initialize(){
    sensores = [
      Sensor(id: '1', name: 'Sensor de Temperatura', status: 'Active'),
      Sensor(id: '2', name: 'Sensor de Umidade', status: 'Inactive'),
      Sensor(id: '3', name: 'Sensor de Luz', status: 'Active')
    ];

    atuadores = [
      Atuador(id: '1', name: 'Atuador de Irrigação', state: 'Off'),
      Atuador(id: '2', name: 'Atuador de Resfriamento', state: 'Off'),
      Atuador(id: '3', name: 'Atuador de Aquecimento', state: 'Off'),
      Atuador(id: '4', name: 'Atuador de Lâmpada', state: 'Off'),
      Atuador(id: '5', name: 'Atuador de Curtina', state: 'Off')
    ];

    notifyListeners();
  }
}