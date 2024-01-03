import 'dart:developer';

import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:app_cetis27/logica/modelos/reporte.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:flutter/material.dart';

class PantallaVistaCategoria extends StatefulWidget {
  static String ruta = '/pantallaVistaCategoria';
  Function? actualizar;

  @override
  State<PantallaVistaCategoria> createState() => _PantallaVistaCategoriaState();
}

class _PantallaVistaCategoriaState extends State<PantallaVistaCategoria> {
  @override
  void initState() {
    widget.actualizar = () {
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: Componentes.getBarraSuperior('Detalle de la categoria'),
        body: Container(
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: Color(0xFFfafafa),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                //height: 350,
                height: 300,
                child: Componentes.getCardTipo9(),
              ),
            ],
          ),
        ),
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Componentes.getBotonTipo4('Editar', 19, Colors.green, 18,
                FontWeight.w800, Reporte(), Argumentos.argsCategoriaActual),
            Componentes.getBotonTipo4('Eliminar', 20, Colors.red, 18,
                FontWeight.w800, Reporte(), Argumentos.argsCategoriaActual),
          ],
        ),
      ),
    );
  }
}
