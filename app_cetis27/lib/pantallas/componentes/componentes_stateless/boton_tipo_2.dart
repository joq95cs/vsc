import 'package:app_cetis27/logica/funciones.dart';
import 'package:app_cetis27/logica/valores_activos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotonTipo2 extends StatelessWidget {
  String _texto;
  int _f;
  IconData _icono;
  double _ancho;
  double _alto;
  double _mb;

  BotonTipo2(
      this._texto, this._f, this._icono, this._ancho, this._alto, this._mb);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: _mb),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
        ),
        child: Container(
          width: _ancho,
          height: _alto,
          child: Row(
            children: [
              Icon(_icono),
              SizedBox(
                width: 15,
              ),
              Text(
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
            ],
          ),
        ),
        onPressed: () {
          if (_f == 1) {
            Funciones.btn2IrPantallaNuevoReporte(context);
          } else if (_f == 2) {
            Funciones.btn2VerReportesRecibidos(context);
          } else if (_f == 3) {
            Funciones.btn2VerReportesEnviados(context);
          } else if (_f == 4) {
            Funciones.btn2VerCategoriasPendientes(context);
          } else if (_f == 5) {
            if (ValoresActivos.usuario.tipo == 3) {
              Funciones.btn2IrPantallaElegirNuevaCategoria(context);
            } else {
              Funciones.btn2IrPantallaNuevaCategoria(context);
            }
          } else if (_f == 6) {
            Funciones.btn2VerCategorias(context);
          } else if (_f == 7) {
            Funciones.btn2IrPantallaNuevaCategoriaEspacio(context);
          } else if (_f == 8) {
            Funciones.btn2IrPantallaNuevaCategoria(context);
          } else if (_f == 20) {
            Funciones.btn2SeleccionarFoto(context);
          }
        },
      ),
    );
  }
}
