import 'dart:developer';

import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_stateless/boton_tipo_4.dart';
import 'package:flutter/material.dart';

class PantallaVistaReporte2 extends StatefulWidget {
  static PantallaVistaReporte2 pantallaVistaReporte2 = PantallaVistaReporte2();
  static String ruta = '/pantallaVistaReporte2';
  Function? actualizar;

  @override
  State<PantallaVistaReporte2> createState() => _PantallaVistaReporte2State();
}

class _PantallaVistaReporte2State extends State<PantallaVistaReporte2> {
  @override
  void initState() {
    widget.actualizar = () {
      setState(() {
        log('Hola');
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    Container foto = Container(
      height: 300,
      child: Componentes.getCardTipo4(),
    );

    if (Argumentos.argsReporteActual.foto == 'ninguno') {
      foto = Container();
    }

    List<BotonTipo4> botones = [];

    if (Argumentos.argsReporteActual.estatus as String == 'Pendiente') {
      botones.add(Componentes.getBotonTipo4('Editar', 11, Colors.green, 18,
          FontWeight.w800, Argumentos.argsReporteActual, Categoria()));

      botones.add(Componentes.getBotonTipo4('Eliminar', 12, Colors.red, 18,
          FontWeight.w800, Argumentos.argsReporteActual, Categoria()));
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: Componentes.getBarraSuperior('Detalle del reporte'),
        body: Container(
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: Color(0xFFfafafa),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 300,
                //height: 200,
                child: Componentes.getCardTipo3(),
              ),
              foto,
            ],
          ),
        ),
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: botones,
        ),
      ),
    );
  }
}
