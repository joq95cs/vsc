import 'dart:convert';
import 'package:app_cetis27/logica/constantes.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:app_cetis27/logica/valores_activos.dart';
import 'package:http/http.dart' as http;

class CategoriasPendientes {
  static List<Categoria> categoriasPendientes = [];
  Future<List<Categoria>> obtenerPorEspacio() async {
    var respuesta = await http.post(
      Uri.parse(
          '${Constantes.SERVER_URL}/curso_php/cetis_27/get_pending_categories.php'),
      body: {
        'espacio': ValoresActivos.espacio.id.toString(),
      },
    );

    if (respuesta.statusCode == 200) {
      if (respuesta.body != '"error"') {
        var registros = jsonDecode(respuesta.body);

        List<Categoria> categorias = [];
        for (int i = 0; i < registros.length; i++) {
          categorias.add(Categoria(
            id: registros[i]['id_categoria_pendiente'],
            nombre: registros[i]['nombre'],
            descripcion: registros[i]['descripcion'],
            espacio: registros[i]['espacio'],
          ));
        }
        return categorias;
      } else {
        return [];
      }
    } else {
      throw Exception();
    }
  }
}
