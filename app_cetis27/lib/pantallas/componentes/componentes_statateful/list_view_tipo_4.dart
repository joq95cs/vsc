import 'package:app_cetis27/logica/cargar_categorias.dart';
import 'package:app_cetis27/logica/categorias_pendientes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:flutter/material.dart';

class ListViewTipo4 extends StatefulWidget {
  Function? actualizar;

  @override
  State<ListViewTipo4> createState() => _ListViewTipo4State();
}

class _ListViewTipo4State extends State<ListViewTipo4> {
  @override
  void initState() {
    widget.actualizar = () {
      CargarCategorias cargarCategorias = CargarCategorias();
      cargarCategorias.obtenerPorEspacio().then((futuro) {
        setState(() {
          CargarCategorias.categoriasEspacio = futuro;
        });
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CargarCategorias.categoriasEspacio.length,
      itemBuilder: (context, index) {
        return Componentes.getCardTipo8(
            CargarCategorias.categoriasEspacio[index]);
      },
    );
  }
}
