import 'package:app_cetis27/logica/constantes.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:http/http.dart' as http;

class NuevaCategoria {
  Categoria _categoria;

  NuevaCategoria(this._categoria);

  Future<int> agregar() async {
    var respuesta = await http.post(
      Uri.parse(
          '${Constantes.SERVER_URL}/curso_php/cetis_27/new_pending_category.php'),
      body: {
        'nombre': _categoria.nombre,
        'descripcion': _categoria.descripcion,
        'espacio': _categoria.espacio.toString(),
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
