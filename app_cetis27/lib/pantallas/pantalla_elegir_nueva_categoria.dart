import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/cargar_espacios.dart';
import 'package:app_cetis27/logica/modelos/espacio.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_4.dart';
import 'package:flutter/material.dart';

class PantallaElegirNuevaCategoria extends StatelessWidget {
  static String ruta = '/pantallaElegirNuevaCategoria';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: Componentes.getBarraSuperior('Elegir tipo de categoría'),
          body: Container(
            margin: EdgeInsets.only(top: 15.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Color(0xFFfafafa),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Componentes.getBotonTipo2(
                  'Mi Espacio',
                  7,
                  Icons.house,
                  300,
                  50,
                  20,
                ),
                Componentes.getBotonTipo2(
                  'Otro Espacio',
                  8,
                  Icons.other_houses,
                  300,
                  50,
                  20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
