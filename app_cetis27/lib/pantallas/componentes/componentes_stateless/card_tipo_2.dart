import 'package:app_cetis27/logica/constantes.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:app_cetis27/logica/modelos/reporte.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/temporal/reportes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//REPORTES RECIBIDOS
class CardTipo2 extends StatelessWidget {
  Reporte _reporte;

  CardTipo2(this._reporte);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text(
              _reporte.asunto as String,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000912),
                ),
              ),
            ),
            subtitle: Text(
              _reporte.descripcion as String,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
            leading: Constantes.ICONOS[3],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Componentes.getBotonTipo4('Ver', 1, Colors.blue, 16,
                  FontWeight.w400, _reporte, Categoria()),
              Componentes.getBotonTipo4('Aceptar', 2, Colors.green, 16,
                  FontWeight.w400, _reporte, Categoria()),
              Componentes.getBotonTipo4('Reenviar', 3, Colors.blue, 16,
                  FontWeight.w400, _reporte, Categoria()),
              Componentes.getBotonTipo4('Rechazar', 4, Colors.red, 16,
                  FontWeight.w400, _reporte, Categoria()),
            ],
          ),
        ],
      ),
    );
  }
}
