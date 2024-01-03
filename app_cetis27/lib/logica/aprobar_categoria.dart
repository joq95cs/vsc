import 'dart:developer';

import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/constantes.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:http/http.dart' as http;

class AprobarCategoria {
  Categoria _categoria;
  AprobarCategoria(this._categoria);

  Future<int> aprobarTipo0() async {
    var respuesta = await http.post(
      Uri.parse('${Constantes.SERVER_URL}/curso_php/cetis_27/new_category.php'),
      body: {
        'nombre': _categoria.nombre,
        'descripcion': _categoria.descripcion,
        'espacio': _categoria.espacio.toString(),
        'departamento': 'null',
        'subdepartamento': 'null',
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

  Future<int> aprobarTipo1() async {
    var respuesta = await http.post(
      Uri.parse('${Constantes.SERVER_URL}/curso_php/cetis_27/new_category.php'),
      body: {
        'nombre': _categoria.nombre,
        'descripcion': _categoria.descripcion,
        'espacio': _categoria.espacio.toString(),
        'departamento':
            (Argumentos.argsDepartamentoSeleccionado.id as int).toString(),
        'subdepartamento': 'null',
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

  Future<int> aprobarTipo2() async {
    var respuesta = await http.post(
      Uri.parse('${Constantes.SERVER_URL}/curso_php/cetis_27/new_category.php'),
      body: {
        'nombre': _categoria.nombre,
        'descripcion': _categoria.descripcion,
        'espacio': _categoria.espacio.toString(),
        'departamento':
            (Argumentos.argsDepartamentoSeleccionado.id as int).toString(),
        'subdepartamento':
            (Argumentos.argsSubdepartamentoSeleccionado.id as int).toString(),
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

  Future<int> actualizarTipo0() async {
    var respuesta = await http.post(
      Uri.parse(
          '${Constantes.SERVER_URL}/curso_php/cetis_27/update_category.php'),
      body: {
        'nombre': _categoria.nombre,
        'descripcion': _categoria.descripcion,
        'espacio': _categoria.espacio.toString(),
        'departamento': 'null',
        'subdepartamento': 'null',
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

  Future<int> actualizarTipo1() async {
    var respuesta = await http.post(
      Uri.parse(
          '${Constantes.SERVER_URL}/curso_php/cetis_27/update_category.php'),
      body: {
        'nombre': _categoria.nombre,
        'descripcion': _categoria.descripcion,
        'espacio': _categoria.espacio.toString(),
        'departamento':
            (Argumentos.argsDepartamentoSeleccionado.id as int).toString(),
        'subdepartamento': 'null',
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

  Future<int> actualizarTipo2() async {
    var respuesta = await http.post(
      Uri.parse(
          '${Constantes.SERVER_URL}/curso_php/cetis_27/update_category.php'),
      body: {
        'nombre': _categoria.nombre,
        'descripcion': _categoria.descripcion,
        'espacio': _categoria.espacio.toString(),
        'departamento':
            (Argumentos.argsDepartamentoSeleccionado.id as int).toString(),
        'subdepartamento':
            (Argumentos.argsSubdepartamentoSeleccionado.id as int).toString(),
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

  Future<int> eliminarPendiente() async {
    var respuesta = await http.post(
      Uri.parse(
          '${Constantes.SERVER_URL}/curso_php/cetis_27/delete_pending_category.php'),
      body: {
        'id': _categoria.id.toString(),
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
