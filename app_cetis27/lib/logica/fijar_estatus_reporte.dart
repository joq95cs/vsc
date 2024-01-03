import 'package:app_cetis27/logica/constantes.dart';
import 'package:http/http.dart' as http;

class FijarStatusReporte {
  int _id;
  String _estatus;
  FijarStatusReporte(this._id, this._estatus);
  Future<int> fijar() async {
    var respuesta = await http.post(
      Uri.parse(
          '${Constantes.SERVER_URL}/curso_php/cetis_27/set_status_report.php'),
      body: {
        'id': _id.toString(),
        'estatus': _estatus,
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
