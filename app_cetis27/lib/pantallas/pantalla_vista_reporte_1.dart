import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:app_cetis27/logica/modelos/reporte.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:flutter/material.dart';

class PantallaVistaReporte1 extends StatefulWidget {
  static String ruta = '/pantallaVistaReporte1';
  Function? actualizar;

  @override
  State<PantallaVistaReporte1> createState() => _PantallaVistaReporte1State();
}

class _PantallaVistaReporte1State extends State<PantallaVistaReporte1> {
  @override
  void initState() {
    widget.actualizar = () {
      setState(() {});
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
                //height: 350,
                height: 300,
                child: Componentes.getCardTipo3(),
              ),
              foto,
            ],
          ),
        ),
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Componentes.getBotonTipo4('Aceptar', 8, Colors.green, 18,
                FontWeight.w800, Argumentos.argsReporteActual, Categoria()),
            Componentes.getBotonTipo4('Reenviar', 9, Colors.blue, 18,
                FontWeight.w800, Argumentos.argsReporteActual, Categoria()),
            Componentes.getBotonTipo4('Rechazar', 10, Colors.red, 18,
                FontWeight.w800, Argumentos.argsReporteActual, Categoria()),
          ],
        ),
      ),
    );
  }
}
