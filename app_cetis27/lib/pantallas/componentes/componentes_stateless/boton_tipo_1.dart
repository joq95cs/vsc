import 'dart:developer';
import 'package:app_cetis27/logica/funciones.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotonTipo1 extends StatelessWidget {
  String _texto;
  int _f;

  BotonTipo1(this._texto, this._f);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Color(0xff008FFF),
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            color: Color(0x60008FFF),
            blurRadius: 10,
            offset: Offset(0, 5),
            spreadRadius: 0,
          ),
        ],
      ),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Text(
          _texto,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: 3,
            ),
          ),
        ),
        onPressed: () {
          if (_f == 1) {
            //Pantalla Login
            Funciones.btn1Login(context);
          } else if (_f == 2) {
            //Pantalla Nuevo Reporte
            Funciones.btn1AgregarReporte(context);
          } else if (_f == 3) {
            //Pantalla Reenviar Reporte
            Funciones.btn1ActualizarReporte1(context, 1);
          } else if (_f == 4) {
            //Pantalla Reenviar Reporte desde Vista
            Funciones.btn1ActualizarReporte1(context, 2);
          } else if (_f == 5) {
            //Pantalla Editar Reporte
            Funciones.btn1ActualizarReporte2(context, 1);
          } else if (_f == 6) {
            //Pantalla Editar Reporte desde Vista
            Funciones.btn1ActualizarReporte2(context, 2);
          } else if (_f == 7) {
            //Pantalla Nueva Categoría
            Funciones.btn1AgregarCategoria(context);
          } else if (_f == 8) {
            //Pantalla Editar Categoría
            Funciones.btn1IrPantallaAprobarCategoria2(context);
          } else if (_f == 9) {
            //Pantalla AprobarCategoría
            Funciones.btn1AprobarCategoria(context, 1);
          } else if (_f == 10) {
            //Pantalla Aprobar Categoría después de Editar
            Funciones.btn1AprobarCategoria(context, 2);
          } else if (_f == 11) {
            Funciones.btn1AgregarCategoriaEspacio(context);
          } else if (_f == 12) {
            Funciones.btn1IrPantallaAprobarCategoria3(context);
          } else if (_f == 13) {
            Funciones.btn1ActualizarCategoria(context);
          }
        },
      ),
    );
  }
}
