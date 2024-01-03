import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/cargar_espacios.dart';
import 'package:app_cetis27/logica/modelos/espacio.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_4.dart';
import 'package:flutter/material.dart';

class PantallaNuevaCategoria extends StatelessWidget {
  static String ruta = '/pantallaNuevaCategoria';
  TextEditingController _controladorNombre = TextEditingController();
  TextEditingController _controladorDescripcion = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          appBar: Componentes.getBarraSuperior('Nueva categoría'),
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
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Componentes.getEtiqueta('Espacio'),
                                  Componentes.getDesplegableTipo4(
                                    nombresEspacios,
                                    nombresEspacios[0],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Componentes.getEtiqueta('Subespacio'),
                                  DesplegableTipo4.desplegableTipo5,
                                ],
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          Text('¡Ha ocurrido un error!');
                        }

                        return CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  alignment: Alignment.bottomCenter,
                  child: Componentes.getBotonTipo1(
                    'CREAR',
                    7,
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
