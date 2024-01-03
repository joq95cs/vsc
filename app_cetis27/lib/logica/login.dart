import 'dart:developer';

import 'package:app_cetis27/logica/constantes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'modelos/usuario.dart';

class Login {
  String _username;
  String _password;
  Login(this._username, this._password);
  Future<Usuario> verify() async {
    var respuesta = await http.post(
      Uri.parse('${Constantes.SERVER_URL}/curso_php/cetis_27/login.php'),
      body: {
        'username': _username,
        'password': _password,
      },
    );

    if (respuesta.statusCode == 200) {
      if (respuesta.body != '"error"') {
        var objetoJson = json.decode(respuesta.body);
        return Usuario(
          true,
          id: objetoJson[0],
          nombre: objetoJson[1],
          apellidoPaterno: objetoJson[2],
          apellidoMaterno: objetoJson[3],
          nivel: objetoJson[4],
          tipo: objetoJson[5],
        );
      } else {
        return Usuario(false);
      }
    } else {
      throw Exception();
    }
  }
}
