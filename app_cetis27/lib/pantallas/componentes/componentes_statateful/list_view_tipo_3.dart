import 'package:app_cetis27/logica/categorias_pendientes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:flutter/material.dart';

class ListViewTipo3 extends StatefulWidget {
  Function? actualizar;

  @override
  State<ListViewTipo3> createState() => _ListViewTipo3State();
}

class _ListViewTipo3State extends State<ListViewTipo3> {
  @override
  void initState() {
    widget.actualizar = () {
      CategoriasPendientes categoriasPendientes = CategoriasPendientes();
      categoriasPendientes.obtenerPorEspacio().then((futuro) {
        setState(() {
          CategoriasPendientes.categoriasPendientes = futuro;
        });
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CategoriasPendientes.categoriasPendientes.length,
      itemBuilder: (context, index) {
        return Componentes.getCardTipo7(
          CategoriasPendientes.categoriasPendientes[index],
        );
      },
    );
  }
}
