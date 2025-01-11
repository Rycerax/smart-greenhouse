class Sensor {
  final String id;
  final String name;
  String value;
  String status;

  Sensor({
    required this.id,
    required this.name,
    required this.value,
    this.status = "Inativo",
  });

  void updateStatus(String newStatus) {
    status = newStatus;
  }
}
