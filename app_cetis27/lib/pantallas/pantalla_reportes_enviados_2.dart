import 'package:app_cetis27/logica/reportes_enviados.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/list_view_tipo_2.dart';
import 'package:flutter/material.dart';

class PantallaReportesEnviados2 extends StatelessWidget {
  static String ruta = '/pantallaReportesEnviados2';
  static ListViewTipo2 listViewTipo2 = Componentes.getListViewTipo2();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Componentes.getBarraSuperior('Reportes enviados'),
        body: Column(
          children: [
            Expanded(
              child: PantallaReportesEnviados2.listViewTipo2,
            ),
          ],
        ),
      ),
    );
  }
}
