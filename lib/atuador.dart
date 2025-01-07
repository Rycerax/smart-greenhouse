class Atuador {
  final String id;
  final String name;
  String state;

  Atuador({required this.id, required this.name, this.state = "Off"});

  void toggleState(){
    state = state == "On" ? "Off" : "On";
  }
}