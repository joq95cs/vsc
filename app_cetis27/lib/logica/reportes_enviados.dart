import 'package:app_cetis27/logica/constantes.dart';
import 'package:app_cetis27/logica/modelos/reporte.dart';
import 'package:app_cetis27/logica/valores_activos.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ReportesEnviados {
  static List<Reporte> reportesEnviados = [];
  Future<List<Reporte>> obtenerPorUsuario() async {
    var respuesta = await http.post(
      Uri.parse(
          '${Constantes.SERVER_URL}/curso_php/cetis_27/get_sent_reports_user.php'),
      body: {
        'id': ValoresActivos.usuario.id.toString(),
      },
    );

    if (respuesta.statusCode == 200) {
      if (respuesta.body != '"error"') {
        var registros = jsonDecode(respuesta.body);

        List<Reporte> reportes = [];
        for (int i = 0; i < registros.length; i++) {
          reportes.add(Reporte(
            id: registros[i]['id_reporte'],
            asunto: registros[i]['asunto'],
            descripcion: registros[i]['descripcion'],
            foto: registros[i]['foto'],
            fecha: registros[i]['fecha'],
            usuario: registros[i]['usuario'],
            categoria: registros[i]['categoria'],
            espacio: registros[i]['espacio'],
            estatus: registros[i]['estatus'],
          ));
        }
        return reportes;
      } else {
        return [];
      }
    } else {
      throw Exception();
    }
  }
}
