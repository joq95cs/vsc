import 'dart:convert';
import 'dart:developer';
import 'package:app_cetis27/logica/valores_activos.dart';
import 'package:http/http.dart' as http;
import 'package:app_cetis27/logica/constantes.dart';
import 'package:app_cetis27/logica/modelos/reporte.dart';

class ReportesRecibidos {
  static List<Reporte> reportesRecibidos = [];
  Future<List<Reporte>> obtenerPorEspacio() async {
    var respuesta = await http.post(
      Uri.parse(
          '${Constantes.SERVER_URL}/curso_php/cetis_27/get_received_reports_space.php'),
      body: {
        'espacio': ValoresActivos.espacio.id.toString(),
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
