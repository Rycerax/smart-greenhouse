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
  }
}