import 'dart:developer';

import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/cargar_categorias.dart';
import 'package:app_cetis27/logica/cargar_espacios.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:app_cetis27/logica/modelos/espacio.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_1.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_2.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_3.dart';
import 'package:flutter/material.dart';

class PantallaEditarReporte2 extends StatelessWidget {
  static String ruta = '/pantallaEditarReporte2';

  TextEditingController _controladorAsunto = TextEditingController();
  TextEditingController _controladorDescripcion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controladorAsunto.text = Argumentos.argsReporteActual.asunto as String;
    _controladorDescripcion.text =
        Argumentos.argsReporteActual.descripcion as String;
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
          appBar: Componentes.getBarraSuperior('Editar reporte'),
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

                          String espacioActual = '';

                          Argumentos.argsEspacios.forEach((Espacio espacio) {
                            if (espacio.id ==
                                Argumentos.argsReporteActual.espacio) {
                              Argumentos.argsEspacioSeleccionado = espacio;
                              espacioActual = espacio.tipo as String;
                            }
                          });

                          DesplegableTipo1.desplegableTipo1 =
                              Componentes.getDesplegableTipo1(
                                  nombresEspacios, espacioActual);

                          Argumentos.argsSubespacios = [];
                          Argumentos.argsEspacios.forEach((Espacio espacio) {
                            if (espacio.tipo as String == espacioActual) {
                              Argumentos.argsSubespacios.add(espacio);
                            }
                          });

                          List<String> nombresSubespacios = [];
                          Argumentos.argsSubespacios
                              .forEach((Espacio subespacio) {
                            nombresSubespacios.add(subespacio.nombre as String);
                          });

                          nombresSubespacios.insert(0, 'Seleccione');

                          String subespacioActual = '';
                          Argumentos.argsSubespacios
                              .forEach((Espacio subespacio) {
                            if (subespacio.id ==
                                Argumentos.argsReporteActual.espacio) {
                              subespacioActual = subespacio.nombre as String;
                            }
                          });

                          DesplegableTipo1.desplegableTipo2 =
                              Componentes.getDesplegableTipo2(
                                  nombresSubespacios, subespacioActual);

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

                                    Argumentos.argsCategoriasEspacio = [];
                                    Argumentos.argsCategorias
                                        .forEach((Categoria categoria) {
                                      if (categoria.espacio ==
                                          Argumentos
                                              .argsEspacioSeleccionado.id) {
                                        Argumentos.argsCategoriasEspacio
                                            .add(categoria);
                                      }
                                    });

                                    List<String> nombresCategorias = [];

                                    Argumentos.argsCategoriasEspacio
                                        .forEach((Categoria categoria) {
                                      nombresCategorias
                                          .add(categoria.nombre as String);
                                    });

                                    nombresCategorias.insert(0, 'Seleccione');

                                    String categoriaActual = '';

                                    Argumentos.argsCategoriasEspacio
                                        .forEach((Categoria categoria) {
                                      if (categoria.id ==
                                          Argumentos
                                              .argsReporteActual.categoria) {
                                        categoriaActual =
                                            categoria.nombre as String;
                                        Argumentos.argsCategoriaSeleccionada =
                                            categoria;
                                      }
                                    });

                                    DesplegableTipo2.desplegableTipo3 =
                                        Componentes.getDesplegableTipo3(
                                            nombresCategorias, categoriaActual);

                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Componentes.getEtiqueta('Categoría'),
                                        DesplegableTipo2.desplegableTipo3,
                                      ],
                                    );
                                  } else if (snap.hasError) {
                                    return Text('¡Ha sucedido un error!');
                                  }

                                  return CircularProgressIndicator();
                                },
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text('¡Ha sucedido un error!');
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
                    'ACTUALIZAR',
                    6,
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
