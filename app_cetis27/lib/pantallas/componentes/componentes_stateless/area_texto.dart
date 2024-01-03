import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AreaTexto extends StatelessWidget {
  TextEditingController _controlador;
  AreaTexto(this._controlador);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            controller: _controlador,
            maxLines: 10,
            decoration: InputDecoration.collapsed(
              hintText: "Descripción...",
              hintStyle: TextStyle(
                color: Color(0xffA6B0BD),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xff000912),
              ),
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 25,
            offset: Offset(0, 5),
            spreadRadius: -25,
          ),
        ],
      ),
    );
  }
}
