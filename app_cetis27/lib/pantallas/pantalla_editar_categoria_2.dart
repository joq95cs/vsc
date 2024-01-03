import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/cargar_espacios.dart';
import 'package:app_cetis27/logica/modelos/espacio.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_4.dart';
import 'package:flutter/material.dart';

class PantallaEditarCategoria2 extends StatelessWidget {
  static String ruta = '/pantallaEditarCategoria2';
  TextEditingController _controladorNombre = TextEditingController();
  TextEditingController _controladorDescripcion = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _controladorNombre.text = Argumentos.argsCategoriaActual.nombre as String;
    _controladorDescripcion.text =
        Argumentos.argsCategoriaActual.descripcion as String;
    Argumentos.argsNuevaCategoria = [
      _controladorNombre,
      _controladorDescripcion
    ];

    Argumentos.argsEspacioSeleccionado = Espacio();

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: Componentes.getBarraSuperior('Editar categoría'),
          body: Container(
            margin: EdgeInsets.only(top: 15.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Color(0xFFfafafa),
            width: double.infinity,
            child: Stack(
              children: [
                Column(
                  children: [
                    Componentes.getCampoTextoTipo1(
                      'Nombre',
                      Icon(Icons.edit),
                      false,
                      _controladorNombre,
                    ),
                    Componentes.getAreaTexto(
                      _controladorDescripcion,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  alignment: Alignment.bottomCenter,
                  child: Componentes.getBotonTipo1(
                    'ACTUALIZAR',
                    12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
