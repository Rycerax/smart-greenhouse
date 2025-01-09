
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:smart_greenhouse/protos/greenhouse.pb.dart';

class SocketClient {
  final String host;
  final int port;

  SocketClient({required this.host, required this.port});

  Future<void> receiveData(Command cmd) async {
    try {
      final socket = await Socket.connect(host, port);
      print('Conectado ao servidor: $host:$port');

      final serializedData = cmd.writeToBuffer();

      socket.add(serializedData);
      print('Mensagem enviada: $cmd');

      socket.listen((List<int> data) {
        final response = Response.fromBuffer((Uint8List.fromList(data)));
        print('Tamnanho da resposta recebida: ${response.deviceStatus.length}');
      });

      await socket.flush();
      socket.destroy();
    } catch (e) {
      print('Erro na comunicação com o servidor: $e');
    }
  }
}