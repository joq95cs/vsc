import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EstiloTexto {
  static TextStyle getEstiloTexto(double fs, FontWeight fw, Color c) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: fs,
        fontWeight: fw,
        color: c,
      ),
    );
  }
}
