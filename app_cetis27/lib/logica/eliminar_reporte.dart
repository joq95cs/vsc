import 'package:app_cetis27/logica/constantes.dart';
import 'package:http/http.dart' as http;

class EliminarReporte {
  int _id;
  EliminarReporte(this._id);
  Future<int> eliminar() async {
    var respuesta = await http.post(
      Uri.parse(
          '${Constantes.SERVER_URL}/curso_php/cetis_27/delete_report.php'),
      body: {
        'id': _id.toString(),
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
