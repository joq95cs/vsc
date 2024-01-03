import 'dart:developer';

import 'package:app_cetis27/logica/funciones.dart';
import 'package:app_cetis27/logica/reportes_enviados.dart';
import 'package:app_cetis27/logica/reportes_recibidos.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:flutter/material.dart';

class ListViewTipo1 extends StatefulWidget {
  Function? actualizar;

  @override
  State<ListViewTipo1> createState() => _ListViewTipo1State();
}

class _ListViewTipo1State extends State<ListViewTipo1> {
  @override
  void initState() {
    widget.actualizar = () {
      ReportesRecibidos reportesRecibidos = ReportesRecibidos();
      reportesRecibidos.obtenerPorEspacio().then((futuro) {
        setState(() {
          ReportesRecibidos.reportesRecibidos = futuro;
        });
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ReportesRecibidos.reportesRecibidos.length,
      itemBuilder: (context, index) {
        return Componentes.getCardTipo2(
          ReportesRecibidos.reportesRecibidos[index],
        );
      },
    );
  }
}
