import 'dart:async';
import 'dart:io';
import 'package:smart_greenhouse/protos/greenhouse.pb.dart';

class SocketClient {
  final String host;
  final int port;

  SocketClient({required this.host, required this.port});

  Future<List<DeviceStatus>> receiveData(Command cmd) async {
    final Completer<List<DeviceStatus>> completer = Completer();
    List<DeviceStatus> res = [];

    try {
      // Conecta ao servidor
      final socket = await Socket.connect(host, port);
      print('Conectado ao servidor: $host:$port');

      // Serializar e enviar o comando
      final serializedData = cmd.writeToBuffer();
      socket.add(serializedData);
      print('Mensagem enviada: $cmd');

      // Escutar a resposta do servidor
      socket.listen(
        (List<int> data) {
          try {
            // Desserializar a resposta
            final response = Response.fromBuffer(data);
            res =
                response.deviceStatus; // Supondo que "deviceStatus" é uma lista
            print('Resposta recebida: $res');

            // Resolver o completer com os dados
            completer.complete(res);
          } catch (e) {
            print('Erro ao desserializar os dados: $e');
            completer.completeError(e);
          }
        },
        onDone: () async {
          // Fechar o socket quando os dados forem processados
          await socket.flush();
          socket.destroy();
        },
        onError: (error) {
          print('Erro no socket: $error');
          completer.completeError(error);
          socket.destroy();
        },
      );
    } catch (e) {
      print('Erro na comunicação com o servidor: $e');
      completer.completeError(e);
    }

    // Aguarda o completer ser resolvido
    return completer.future;
  }
}
