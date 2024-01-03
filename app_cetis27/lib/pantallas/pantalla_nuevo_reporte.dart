import 'dart:developer';

import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/cargar_categorias.dart';
import 'package:app_cetis27/logica/cargar_espacios.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:app_cetis27/logica/modelos/espacio.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_1.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PantallaNuevoReporte extends StatelessWidget {
  static String ruta = '/pantallaNuevoReporte';

  TextEditingController _controladorAsunto = TextEditingController();
  TextEditingController _controladorDescripcion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Argumentos.argsNuevoReporte = [
      _controladorAsunto,
      _controladorDescripcion,
    ];

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: Componentes.getBarraSuperior('Nuevo reporte'),
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
                      'Asunto',
                      Icon(Icons.edit),
                      false,
                      _controladorAsunto,
                    ),
                    Componentes.getAreaTexto(_controladorDescripcion),
                    FutureBuilder(
                      future: CargarEspacios().obtener(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          Argumentos.argsEspacios =
                              snapshot.data as List<Espacio>;

                          List<String> nombresEspacios = [];

                          Argumentos.argsEspacios.forEach((Espacio espacio) {
                            if (!nombresEspacios.contains(espacio.tipo)) {
                              nombresEspacios.add(espacio.tipo as String);
                            }
                          });

                          nombresEspacios.insert(0, 'Seleccione');

                          DesplegableTipo1.desplegableTipo1 =
                              Componentes.getDesplegableTipo1(
                                  nombresEspacios, nombresEspacios[0]);

                          DesplegableTipo1.desplegableTipo2 =
                              Componentes.getDesplegableTipo2(
                                  ['Seleccione'], 'Seleccione');

                          DesplegableTipo2.desplegableTipo3 =
                              Componentes.getDesplegableTipo3(
                                  ['Seleccione'], 'Seleccione');

                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Componentes.getEtiqueta('Espacio'),
                                  DesplegableTipo1.desplegableTipo1,
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Componentes.getEtiqueta('Subespacio'),
                                  DesplegableTipo1.desplegableTipo2,
                                ],
                              ),
                              FutureBuilder(
                                future: CargarCategorias().obtener(),
                                builder: (context, snap) {
                                  if (snap.hasData) {
                                    Argumentos.argsCategorias =
                                        snap.data as List<Categoria>;

                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Componentes.getEtiqueta('Categoría'),
                                        DesplegableTipo2.desplegableTipo3,
                                      ],
                                    );
                                  } else if (snap.hasError) {
                                    return Text('¡Ha ocurrido un error!');
                                  }

                                  return CircularProgressIndicator();
                                },
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text('¡Ha ocurrido un error!');
                        }

                        return CircularProgressIndicator();
                      },
                    ),
                    Container(
                      child: Componentes.getBotonTipo2(
                        'Agregar foto',
                        20,
                        Icons.camera_enhance_outlined,
                        180,
                        30,
                        15,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  alignment: Alignment.bottomCenter,
                  child: Componentes.getBotonTipo1(
                    'ENVIAR',
                    2,
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
