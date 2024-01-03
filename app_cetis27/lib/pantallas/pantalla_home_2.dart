import 'package:app_cetis27/logica/valores_activos.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:flutter/material.dart';

class PantallaHome2 extends StatelessWidget {
  //JEFE ENCARGADO
  static String ruta = '/pantallaHome2';
  @override
  Widget build(BuildContext context) {
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
                        'Reportes recibidos', //Categoría por defecto y dirigidos a su departamento o subdepartamento
                        2,
                        Icons.report,
                        300,
                        50,
                        20,
                      ),
                      Componentes.getBotonTipo2(
                        'Reportes enviados', //Enviados por su departamento y subdepartamentos o subdepartamento
                        3,
                        Icons.history,
                        300,
                        50,
                        20,
                      ),
                      Componentes.getBotonTipo2(
                        'Categorías pendientes', //El encargado del espacio debe aprobarlas o rechazarlas
                        4,
                        Icons.category,
                        300,
                        50,
                        20,
                      ),
                      Componentes.getBotonTipo2(
                        'Crear categoría',
                        8,
                        Icons.category,
                        300,
                        50,
                        20,
                      ),
                      Componentes.getBotonTipo2(
                        'Ver categorías', //Categorías del espacio del cuál es encargado
                        5,
                        Icons.category,
                        300,
                        50,
                        20,
                      ),
                      Componentes.getBotonTipo2(
                        'Ver estadísticas', //De su espacio y departamento y subdepartamento
                        6,
                        Icons.bar_chart,
                        300,
                        50,
                        20,
                      ),
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
