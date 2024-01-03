import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/cargar_categorias.dart';
import 'package:app_cetis27/logica/cargar_espacios.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:app_cetis27/logica/modelos/espacio.dart';
import 'package:app_cetis27/logica/valores_activos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//DESCRIPCIÓN DE REPORTE
class CardTipo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                Argumentos.argsReporteActual.asunto as String,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  'Espacio: ',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                FutureBuilder(
                  future: CargarEspacios().obtener(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Espacio> espacios = snapshot.data as List<Espacio>;

                      String nombreEspacio = '';
                      espacios.forEach((Espacio espacio) {
                        if (espacio.id ==
                            Argumentos.argsReporteActual.espacio) {
                          nombreEspacio = espacio.nombre as String;
                        }
                      });
                      return Text(
                        nombreEspacio,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      Text('Error');
                    }

                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Usuario: ',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Text(
                  "${ValoresActivos.usuario.nombre as String} ${ValoresActivos.usuario.apellidoPaterno as String} ${ValoresActivos.usuario.apellidoMaterno as String}",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Categoría: ',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                FutureBuilder(
                  future: CargarCategorias().obtener(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Categoria> categorias =
                          snapshot.data as List<Categoria>;

                      String nombreCategoria = '';

                      categorias.forEach((Categoria categoria) {
                        if (categoria.id ==
                            Argumentos.argsReporteActual.categoria) {
                          nombreCategoria = categoria.nombre as String;
                        }
                      });

                      return Text(
                        nombreCategoria,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      Text('Error');
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                'Descripción',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                Argumentos.argsReporteActual.descripcion as String,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
