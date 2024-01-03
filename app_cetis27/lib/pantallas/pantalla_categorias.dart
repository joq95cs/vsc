import 'package:app_cetis27/logica/cargar_categorias.dart';
import 'package:app_cetis27/logica/categorias_pendientes.dart';
import 'package:app_cetis27/logica/reportes_recibidos.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/list_view_tipo_4.dart';
import 'package:app_cetis27/pantallas/temporal/reportes.dart';
import 'package:flutter/material.dart';

class PantallaCategorias extends StatelessWidget {
  static String ruta = '/pantallaCategorias';
  static ListViewTipo4 listViewTipo4 = Componentes.getListViewTipo4();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Componentes.getBarraSuperior('Categorías'),
        body: Column(
          children: [
            Expanded(
              child: PantallaCategorias.listViewTipo4,
            ),
          ],
        ),
      ),
    );
  }
}
