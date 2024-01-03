import 'dart:developer';

import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/constantes.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:app_cetis27/logica/modelos/departamento.dart';
import 'package:app_cetis27/logica/modelos/subdepartamento.dart';
import 'package:app_cetis27/logica/valores_activos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CargarDepartamentos {
  Future<List<Departamento>> obtener() async {
    var respuesta = await http.get(
      Uri.parse(
          '${Constantes.SERVER_URL}/curso_php/cetis_27/get_departments.php'),
    );

    if (respuesta.statusCode == 200) {
      if (respuesta.body != '"error"') {
        var registros = jsonDecode(respuesta.body);

        List<Departamento> departamentos = [];
        for (int i = 0; i < registros.length; i++) {
          departamentos.add(
            Departamento(
              id: registros[i]['id_departamento'],
              nombre: registros[i]['nombre'],
              jefe: registros[i]['jefe'],
            ),
          );
        }
        return departamentos;
      } else {
        return [];
      }
    } else {
      throw Exception();
    }
  }

  Future<List<Subdepartamento>> obtenerSubdepartamentos() async {
    var respuesta = await http.post(
      Uri.parse(
          '${Constantes.SERVER_URL}/curso_php/cetis_27/get_subdepartments.php'),
      body: {
        'departamento': Argumentos.argsDepartamentoSeleccionado.id.toString(),
      },
    );

    if (respuesta.statusCode == 200) {
      if (respuesta.body != '"error"') {
        var registros = jsonDecode(respuesta.body);

        List<Subdepartamento> subdepartamentos = [];
        for (int i = 0; i < registros.length; i++) {
          subdepartamentos.add(
            Subdepartamento(
              id: registros[i]['id_subdepartamento'],
              nombre: registros[i]['nombre'],
              jefe: registros[i]['jefe'],
              departamento: registros[i]['departamento'],
            ),
          );
        }
        return subdepartamentos;
      } else {
        return [];
      }
    } else {
      throw Exception();
    }
  }
}
