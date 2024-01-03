import 'package:app_cetis27/logica/categorias_pendientes.dart';
import 'package:app_cetis27/logica/reportes_recibidos.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/list_view_tipo_3.dart';
import 'package:app_cetis27/pantallas/temporal/reportes.dart';
import 'package:flutter/material.dart';

class PantallaCategoriasPendientes extends StatelessWidget {
  static String ruta = '/pantallaCategoriasPendientes';
  static ListViewTipo3 listViewTipo3 = Componentes.getListViewTipo3();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Componentes.getBarraSuperior('Categorías pendientes'),
        body: Column(
          children: [
            Expanded(
              child: PantallaCategoriasPendientes.listViewTipo3,
            ),
          ],
        ),
      ),
    );
  }
}
