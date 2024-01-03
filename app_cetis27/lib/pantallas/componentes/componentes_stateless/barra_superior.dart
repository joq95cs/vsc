import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BarraSuperior {
  static AppBar getBarraSuperior(String titulo) {
    return AppBar(
      title: Text(
        titulo,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
