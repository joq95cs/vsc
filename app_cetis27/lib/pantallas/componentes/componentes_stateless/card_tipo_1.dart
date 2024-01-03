import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:app_cetis27/logica/modelos/reporte.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/temporal/reportes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//REPORTES RECIBIDOS
class CardTipo1 extends StatelessWidget {
  int _index;
  CardTipo1(this._index);
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
              Reportes.recibidos[_index].asunto,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000912),
                ),
              ),
            ),
            subtitle: Text(
              '${Reportes.recibidos[_index].descripcion}\nServicios escolares',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
            isThreeLine: true,
            leading: Reportes.recibidos[_index].icono,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Componentes.getBotonTipo4('Ver', 0, Colors.blue, 16,
                  FontWeight.w400, Reporte(), Categoria()),
              Componentes.getBotonTipo4('Aceptar', 0, Colors.green, 16,
                  FontWeight.w400, Reporte(), Categoria()),
              Componentes.getBotonTipo4('Reenviar', 0, Colors.blue, 16,
                  FontWeight.w400, Reporte(), Categoria()),
              Componentes.getBotonTipo4('Rechazar', 0, Colors.red, 16,
                  FontWeight.w400, Reporte(), Categoria()),
            ],
          ),
        ],
      ),
    );
  }
}
