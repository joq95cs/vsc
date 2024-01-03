import 'dart:developer';

import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:app_cetis27/logica/modelos/espacio.dart';
import 'package:app_cetis27/logica/modelos/subdepartamento.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_2.dart';
import 'package:app_cetis27/pantallas/pantalla_editar_reporte_1.dart';
import 'package:app_cetis27/pantallas/pantalla_nuevo_reporte.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesplegableTipo7 extends StatefulWidget {
  List<String> _valores;
  String _base;

  Function? actualizar;
  Function? reiniciar;

  DesplegableTipo7(this._valores, this._base);
  @override
  State<DesplegableTipo7> createState() => _DesplegableTipo7State();
}

class _DesplegableTipo7State extends State<DesplegableTipo7> {
  String _actual = '';

  @override
  void initState() {
    _actual = widget._base;

    widget.actualizar = () {
      List<String> nombresSubdepartamentos = [];
      Argumentos.argsSubdepartamentos
          .forEach((Subdepartamento subdepartamento) {
        if (subdepartamento.departamento ==
            Argumentos.argsDepartamentoSeleccionado.id) {
          nombresSubdepartamentos.add(subdepartamento.nombre as String);
        }
      });

      nombresSubdepartamentos.insert(0, 'Seleccione');

      setState(() {
        widget._valores = nombresSubdepartamentos;
        widget._base = nombresSubdepartamentos[0];
        _actual = nombresSubdepartamentos[0];
      });
    };

    widget.reiniciar = () {
      setState(() {
        widget._valores = ['Seleccione'];
        widget._base = 'Seleccione';
        _actual = 'Seleccione';
      });
    };
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

        if (_actual != 'Seleccione') {
          Argumentos.argsSubdepartamentos
              .forEach((Subdepartamento subdepartamento) {
            if (_actual == subdepartamento.nombre) {
              Argumentos.argsSubdepartamentoSeleccionado = subdepartamento;
            }
          });

          Argumentos.argsCategoriaActual.tipo = 2;
        } else if (_actual == 'Seleccione') {
          Argumentos.argsSubdepartamentoSeleccionado = Subdepartamento();
          Argumentos.argsCategoriaActual.tipo = 1;
        }
      },
    );
  }
}
