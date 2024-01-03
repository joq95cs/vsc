import 'package:app_cetis27/logica/constantes.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:app_cetis27/logica/valores_activos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CargarCategorias {
  static List<Categoria> categoriasEspacio = [];
  Future<List<Categoria>> obtener() async {
    var respuesta = await http.get(
      Uri.parse(
          '${Constantes.SERVER_URL}/curso_php/cetis_27/get_categories.php'),
    );

    if (respuesta.statusCode == 200) {
      if (respuesta.body != '"error"') {
        var registros = jsonDecode(respuesta.body);

        List<Categoria> categorias = [];
        for (int i = 0; i < registros.length; i++) {
          categorias.add(
            Categoria(
              id: registros[i]['id_categoria'],
              nombre: registros[i]['nombre'],
              descripcion: registros[i]['descripcion'],
              espacio: registros[i]['espacio'],
            ),
          );
        }
        return categorias;
      } else {
        return [];
      }
    } else {
      throw Exception();
    }
  }

  Future<List<Categoria>> obtenerPorEspacio() async {
    var respuesta = await http.post(
      Uri.parse(
          '${Constantes.SERVER_URL}/curso_php/cetis_27/get_categories_space.php'),
      body: {
        'espacio': (ValoresActivos.espacio.id as int).toString(),
      },
    );

    if (respuesta.statusCode == 200) {
      if (respuesta.body != '"error"') {
        var registros = jsonDecode(respuesta.body);

        List<Categoria> categorias = [];
        for (int i = 0; i < registros.length; i++) {
          categorias.add(
            Categoria(
              id: registros[i]['id_categoria'],
              nombre: registros[i]['nombre'],
              descripcion: registros[i]['descripcion'],
              espacio: registros[i]['espacio'],
            ),
          );
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
