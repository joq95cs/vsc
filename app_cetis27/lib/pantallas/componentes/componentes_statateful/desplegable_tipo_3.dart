import 'dart:developer';

import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesplegableTipo3 extends StatefulWidget {
  List<String> _valores;
  String _base;
  Function? actualizar;
  Function? reiniciar;

  DesplegableTipo3(this._valores, this._base);
  @override
  State<DesplegableTipo3> createState() => _DesplegableTipo3State();
}

class _DesplegableTipo3State extends State<DesplegableTipo3> {
  String _actual = '';

  @override
  void initState() {
    _actual = widget._base;

    widget.actualizar = () {
      List<String> nombresCategorias = [];

      Argumentos.argsCategoriasEspacio.forEach((Categoria categoria) {
        nombresCategorias.add(categoria.nombre as String);
      });

      nombresCategorias.insert(0, 'Seleccione');

      setState(() {
        widget._valores = nombresCategorias;
        widget._base = nombresCategorias[0];
        _actual = nombresCategorias[0];
      });
    };

    widget.reiniciar = () {
      Argumentos.argsCategoriasEspacio = [];
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
          Argumentos.argsCategoriasEspacio.forEach((Categoria categoria) {
            if (categoria.nombre == _actual) {
              Argumentos.argsCategoriaSeleccionada = categoria;
            }
          });
        } else if (_actual == 'Seleccione') {
          Argumentos.argsCategoriaSeleccionada = Categoria();
        }
      },
    );
  }
}
