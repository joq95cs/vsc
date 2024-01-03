import 'dart:convert';
import 'dart:io';
import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/constantes.dart';
import 'package:http/http.dart' as http;

class SubirFoto {
  String _bytesFoto = '';
  String _nombreFoto = '';

  SubirFoto() {
    _bytesFoto = base64Encode(
        File(Argumentos.argsFotoSeleccionada!.path).readAsBytesSync());
    _nombreFoto = Argumentos.argsFotoSeleccionada!.path.split('/').last;
  }

  Future<int> subir() async {
    var respuesta = await http.post(
      Uri.parse('${Constantes.SERVER_URL}/curso_php/cetis_27/upload_photo.php'),
      body: {
        'bytesFoto': _bytesFoto,
        'nombreFoto': _nombreFoto,
      },
    );

    if (respuesta.statusCode == 200) {
      String datos = respuesta.body;
      if (datos == '"success"') {
        return 0;
      }

      return 1;
    }

    return 1;
  }
}
