import 'dart:developer';

import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/cargar_categorias.dart';
import 'package:app_cetis27/logica/cargar_departamentos.dart';
import 'package:app_cetis27/logica/cargar_espacios.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:app_cetis27/logica/modelos/departamento.dart';
import 'package:app_cetis27/logica/modelos/espacio.dart';
import 'package:app_cetis27/logica/modelos/subdepartamento.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_1.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_2.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_3.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_6.dart';
import 'package:flutter/material.dart';

class PantallaAprobarCategoria3 extends StatelessWidget {
  static String ruta = '/pantallaAprobarCategoria3';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: Componentes.getBarraSuperior('Aprobar categoría'),
          body: Container(
            margin: EdgeInsets.only(top: 15.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Color(0xFFfafafa),
            width: double.infinity,
            child: Stack(
              children: [
                FutureBuilder(
                  future: CargarDepartamentos().obtener(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Argumentos.argsDepartamentos =
                          snapshot.data as List<Departamento>;

                      List<String> nombresDepartamentos = [];

                      Argumentos.argsDepartamentos
                          .forEach((Departamento departamento) {
                        nombresDepartamentos.add(departamento.nombre as String);
                      });

                      nombresDepartamentos.insert(0, 'Seleccione');

                      DesplegableTipo6.desplegableTipo6 =
                          Componentes.getDesplegableTipo6(
                              nombresDepartamentos, nombresDepartamentos[0]);

                      DesplegableTipo6.desplegableTipo7 =
                          Componentes.getDesplegableTipo7(
                              ['Seleccione'], 'Seleccione');

                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Componentes.getEtiqueta('Departamento'),
                              DesplegableTipo6.desplegableTipo6,
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Componentes.getEtiqueta('Subdepartamento'),
                              DesplegableTipo6.desplegableTipo7,
                            ],
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
                  margin: EdgeInsets.only(bottom: 15.0),
                  alignment: Alignment.bottomCenter,
                  child: Componentes.getBotonTipo1(
                    'ACTUALIZAR',
                    13,
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
