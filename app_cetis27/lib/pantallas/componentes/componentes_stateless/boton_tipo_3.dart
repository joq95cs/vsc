import 'package:app_cetis27/logica/funciones.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotonTipo3 extends StatelessWidget {
  String _texto;
  BotonTipo3(this._texto);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        _texto,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: Color(0xFF008FFF),
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
        ),
      ),
      onPressed: () {
        Funciones.btn3Logout(context);
      },
    );
  }
}
