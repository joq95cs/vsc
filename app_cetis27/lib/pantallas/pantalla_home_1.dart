import 'package:app_cetis27/logica/valores_activos.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:flutter/material.dart';

class PantallaHome1 extends StatelessWidget {
  //JEFE NO ENCARGADO
  static String ruta = '/pantallaHome1';
  @override
  Widget build(BuildContext context) {
    //Usuario temporal

    return SafeArea(
      child: Scaffold(
        appBar: Componentes.getBarraSuperior(
            'Bienvenido(a): ${ValoresActivos.usuario.nombre}'),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //:padding: EdgeInsets.symmetric(horizontal: 40),
              color: Color(0xFFfafafa),
              //color: Colors.orange,
              //width: double.infinity,
              width: 300,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Componentes.getBotonTipo2(
                        'Nuevo reporte',
                        1,
                        Icons.description,
                        300,
                        50,
                        20,
                      ),
                      Componentes.getBotonTipo2(
                        'Reportes recibidos',
                        2,
                        Icons.report,
                        300,
                        50,
                        20,
                      ),
                      Componentes.getBotonTipo2(
                        'Reportes enviados',
                        3,
                        Icons.history,
                        300,
                        50,
                        20,
                      ),
                      /*Componentes.getBotonTipo2(
                        'Categorías pendientes',
                        4,
                        Icons.category,
                        300,
                        50,
                        20,
                      ),*/
                      /*Componentes.getBotonTipo2(
                        'Ver categorías',
                        5,
                        Icons.category,
                        300,
                        50,
                        20,
                      ),*/
                      Componentes.getBotonTipo2(
                        'Crear categoría',
                        8,
                        Icons.category,
                        300,
                        50,
                        20,
                      ),
                      Componentes.getBotonTipo2(
                        'Ver estadísticas',
                        6,
                        Icons.bar_chart,
                        300,
                        50,
                        20,
                      ),
                      /*Componentes.getBotonTipo2(
                        'Registrar usuario',
                        7,
                        Icons.person_add,
                        300,
                        50,
                        20,
                      ),*/
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Componentes.getBotonTipo3('Cerrar sesión'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
