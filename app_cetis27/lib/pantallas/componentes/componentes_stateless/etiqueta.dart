import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Etiqueta extends StatelessWidget {
  String _texto;
  Etiqueta(this._texto);
  @override
  Widget build(BuildContext context) {
    return Text(
      _texto,
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xff000912),
        ),
      ),
    );
  }
}
