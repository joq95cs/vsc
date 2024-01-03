import 'dart:developer';

import 'package:app_cetis27/logica/constantes.dart';
import 'package:app_cetis27/logica/modelos/reporte.dart';
import 'package:http/http.dart' as http;

class ActualizarReporte {
  Reporte _reporte;

  ActualizarReporte(this._reporte);

  Future<int> actualizar() async {
    var respuesta = await http.post(
      Uri.parse(
          '${Constantes.SERVER_URL}/curso_php/cetis_27/update_report.php'),
      body: {
        'id': _reporte.id.toString(),
        'asunto': _reporte.asunto,
        'descripcion': _reporte.descripcion,
        'foto': _reporte.foto,
        'usuario': _reporte.usuario.toString(),
        'categoria': _reporte.categoria.toString(),
        'espacio': _reporte.espacio.toString(),
        'estatus': _reporte.estatus,
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
