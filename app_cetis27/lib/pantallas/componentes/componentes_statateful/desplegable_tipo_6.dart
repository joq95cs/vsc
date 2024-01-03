import 'dart:developer';

import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/cargar_categorias.dart';
import 'package:app_cetis27/logica/cargar_departamentos.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:app_cetis27/logica/modelos/departamento.dart';
import 'package:app_cetis27/logica/modelos/espacio.dart';
import 'package:app_cetis27/logica/modelos/subdepartamento.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_2.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_7.dart';
import 'package:app_cetis27/pantallas/pantalla_editar_reporte_1.dart';
import 'package:app_cetis27/pantallas/pantalla_nuevo_reporte.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesplegableTipo6 extends StatefulWidget {
  static DesplegableTipo6 desplegableTipo6 =
      Componentes.getDesplegableTipo6(['Seleccione'], 'Seleccione');
  static DesplegableTipo7 desplegableTipo7 =
      Componentes.getDesplegableTipo7(['Seleccione'], 'Seleccione');

  List<String> _valores;
  String _base;

  DesplegableTipo6(this._valores, this._base);
  @override
  State<DesplegableTipo6> createState() => _DesplegableTipo6State();
}

class _DesplegableTipo6State extends State<DesplegableTipo6> {
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

        DesplegableTipo6.desplegableTipo7.reiniciar!();

        if (_actual != 'Seleccione') {
          Argumentos.argsDepartamentos.forEach((Departamento departamento) {
            if (_actual == departamento.nombre as String) {
              Argumentos.argsDepartamentoSeleccionado = departamento;
            }
          });

          CargarDepartamentos().obtenerSubdepartamentos().then((futuro) {
            Argumentos.argsSubdepartamentos = futuro;
            DesplegableTipo6.desplegableTipo7.actualizar!();
          });

          Argumentos.argsCategoriaActual.tipo = 1;
        } else if (_actual == 'Seleccione') {
          Argumentos.argsDepartamentoSeleccionado = Departamento();
          Argumentos.argsSubdepartamentoSeleccionado = Subdepartamento();
          Argumentos.argsCategoriaActual.tipo = 0;
        }
      },
    );
  }
}
