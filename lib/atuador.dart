class Atuador {
  final String id;
  final String name;
  String state;
  String unit;

  Atuador({
    required this.id,
    required this.name,
    required this.unit,
    this.state = "Off",
  });

  void toggleState() {
    state = state == "On" ? "Off" : "On";
  }
}
