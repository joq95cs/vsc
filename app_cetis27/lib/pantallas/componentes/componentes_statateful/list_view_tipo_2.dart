import 'dart:developer';

import 'package:app_cetis27/logica/funciones.dart';
import 'package:app_cetis27/logica/reportes_enviados.dart';
import 'package:app_cetis27/logica/reportes_recibidos.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:flutter/material.dart';

class ListViewTipo2 extends StatefulWidget {
  Function? actualizar;

  @override
  State<ListViewTipo2> createState() => _ListViewTipo2State();
}

class _ListViewTipo2State extends State<ListViewTipo2> {
  @override
  void initState() {
    widget.actualizar = () {
      ReportesEnviados reportesEnviados = ReportesEnviados();
      reportesEnviados.obtenerPorUsuario().then((futuro) {
        setState(() {
          ReportesEnviados.reportesEnviados = futuro;
        });
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ReportesEnviados.reportesEnviados.length,
      itemBuilder: (context, index) {
        return Componentes.getCardTipo6(
            ReportesEnviados.reportesEnviados[index]);
      },
    );
  }
}
