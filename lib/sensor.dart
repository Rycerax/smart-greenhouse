class Sensor {
  final String id;
  final String name;
  String status;

  Sensor({required this.id, required this.name, this.status = "Inativo"});

  void updateStatus(String newStatus){
    status = newStatus;
  }
}