import 'dart:developer';

import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/modelos/espacio.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_2.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_5.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesplegableTipo4 extends StatefulWidget {
  static DesplegableTipo5 desplegableTipo5 =
      DesplegableTipo5(['Seleccione'], 'Seleccione');
  List<String> _valores;
  String _base;

  DesplegableTipo4(this._valores, this._base);
  @override
  State<DesplegableTipo4> createState() => _DesplegableTipo4State();
}

class _DesplegableTipo4State extends State<DesplegableTipo4> {
  String _actual = '';

  @override
  void initState() {
    _actual = widget._base;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _actual,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xff000912),
        ),
      ),
      underline: Container(
        height: 2,
        color: Color(0xff008FFF),
      ),
      items: widget._valores.map<DropdownMenuItem<String>>(
        (String valor) {
          return DropdownMenuItem<String>(
            value: valor,
            child: SizedBox(child: Text(valor), width: 140),
          );
        },
      ).toList(),
      onChanged: (String? nuevo) {
        setState(() {
          _actual = nuevo!;
        });

        DesplegableTipo4.desplegableTipo5.reiniciar!();

        if (_actual != 'Seleccione') {
          Argumentos.argsSubespacios = [];
          Argumentos.argsEspacios.forEach((Espacio espacio) {
            if ((espacio.tipo as String) == _actual) {
              Argumentos.argsSubespacios.add(espacio);
            }
          });

          DesplegableTipo4.desplegableTipo5.actualizar!();
        }
      },
    );
  }
}
