import 'package:app_cetis27/logica/reportes_recibidos.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/list_view_tipo_1.dart';
import 'package:app_cetis27/pantallas/temporal/reportes.dart';
import 'package:flutter/material.dart';

//SIN DESPLEGABLES
class PantallaReportesRecibidos2 extends StatelessWidget {
  static String ruta = '/pantallaReportesRecibidos2';
  static ListViewTipo1 listViewTipo1 = Componentes.getListViewTipo1();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Componentes.getBarraSuperior('Reportes recibidos'),
        body: Column(
          children: [
            Expanded(
              child: PantallaReportesRecibidos2.listViewTipo1,
            ),
          ],
        ),
      ),
    );
  }
}
