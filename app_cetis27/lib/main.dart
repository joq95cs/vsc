import 'package:app_cetis27/logica/modelos/espacio.dart';
import 'package:app_cetis27/logica/modelos/usuario.dart';
import 'package:app_cetis27/logica/valores_activos.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/componentes_estaticos.dart';
import 'package:app_cetis27/pantallas/pantalla_aprobar_categoria_1.dart';
import 'package:app_cetis27/pantallas/pantalla_aprobar_categoria_2.dart';
import 'package:app_cetis27/pantallas/pantalla_aprobar_categoria_3.dart';
import 'package:app_cetis27/pantallas/pantalla_categorias.dart';
import 'package:app_cetis27/pantallas/pantalla_categorias_pendientes.dart';
import 'package:app_cetis27/pantallas/pantalla_editar_categoria_1.dart';
import 'package:app_cetis27/pantallas/pantalla_editar_categoria_2.dart';
import 'package:app_cetis27/pantallas/pantalla_editar_reporte_1.dart';
import 'package:app_cetis27/pantallas/pantalla_editar_reporte_2.dart';
import 'package:app_cetis27/pantallas/pantalla_elegir_nueva_categoria.dart';
import 'package:app_cetis27/pantallas/pantalla_home_1.dart';
import 'package:app_cetis27/pantallas/pantalla_home_2.dart';
import 'package:app_cetis27/pantallas/pantalla_home_4.dart';
import 'package:app_cetis27/pantallas/pantalla_home_3.dart';
import 'package:app_cetis27/pantallas/pantalla_login.dart';
import 'package:app_cetis27/pantallas/pantalla_nueva_categoria.dart';
import 'package:app_cetis27/pantallas/pantalla_nueva_categoria_espacio.dart';
import 'package:app_cetis27/pantallas/pantalla_nuevo_reporte.dart';
import 'package:app_cetis27/pantallas/pantalla_reenviar_reporte_1.dart';
import 'package:app_cetis27/pantallas/pantalla_reenviar_reporte_2.dart';
import 'package:app_cetis27/pantallas/pantalla_reportes_enviados_1.dart';
import 'package:app_cetis27/pantallas/pantalla_reportes_enviados_2.dart';
import 'package:app_cetis27/pantallas/pantalla_reportes_recibidos_1.dart';
import 'package:app_cetis27/pantallas/pantalla_reportes_recibidos_2.dart';
import 'package:app_cetis27/pantallas/pantalla_vista_categoria.dart';
import 'package:app_cetis27/pantallas/pantalla_vista_reporte_1.dart';
import 'package:app_cetis27/pantallas/pantalla_vista_reporte_2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ValoresActivos.usuario = Usuario(
      true,
      id: 19,
      nombre: 'Fanny',
      apellidoPaterno: 'Tapia',
      apellidoMaterno: 'Orozco',
      nivel: 4,
      curp: 'CURP',
      tipo: 3,
    );

    ValoresActivos.espacio = Espacio(
      id: 6,
      encargado: 19,
      nombre: 'Aula 1',
      tipo: 'Aula',
    );
    return MaterialApp(
      routes: {
        '/': (context) => PantallaHome3(),
        PantallaHome1.ruta: (context) => PantallaHome1(),
        PantallaHome2.ruta: (context) => PantallaHome2(),
        PantallaHome3.ruta: (context) => PantallaHome3(),
        PantallaHome4.ruta: (context) => PantallaHome4(),
        PantallaNuevoReporte.ruta: (context) => PantallaNuevoReporte(),
        PantallaNuevaCategoria.ruta: (context) => PantallaNuevaCategoria(),
        PantallaReportesRecibidos1.ruta: (context) =>
            PantallaReportesRecibidos1(),
        PantallaReportesRecibidos2.ruta: (context) =>
            PantallaReportesRecibidos2(),
        PantallaReportesEnviados1.ruta: (context) =>
            PantallaReportesEnviados1(),
        PantallaReportesEnviados2.ruta: (context) =>
            PantallaReportesEnviados2(),
        PantallaVistaReporte1.ruta: (context) => PantallaVistaReporte1(),
        PantallaVistaReporte2.ruta: (context) =>
            PantallaVistaReporte2.pantallaVistaReporte2,
        PantallaCategoriasPendientes.ruta: (context) =>
            PantallaCategoriasPendientes(),
        PantallaCategorias.ruta: (context) => PantallaCategorias(),
        PantallaEditarReporte1.ruta: (context) => PantallaEditarReporte1(),
        PantallaEditarReporte2.ruta: (context) => PantallaEditarReporte2(),
        PantallaReenviarReporte1.ruta: (context) => PantallaReenviarReporte1(),
        PantallaReenviarReporte2.ruta: (context) => PantallaReenviarReporte2(),
        PantallaEditarCategoria1.ruta: (context) => PantallaEditarCategoria1(),
        PantallaEditarCategoria2.ruta: (context) => PantallaEditarCategoria2(),
        PantallaVistaCategoria.ruta: (context) => PantallaVistaCategoria(),
        PantallaAprobarCategoria1.ruta: (context) =>
            PantallaAprobarCategoria1(),
        PantallaAprobarCategoria2.ruta: (context) =>
            PantallaAprobarCategoria2(),
        PantallaAprobarCategoria3.ruta: (context) =>
            PantallaAprobarCategoria3(),
        PantallaElegirNuevaCategoria.ruta: (context) =>
            PantallaElegirNuevaCategoria(),
        PantallaNuevaCategoriaEspacio.ruta: (context) =>
            PantallaNuevaCategoriaEspacio(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
