import 'dart:developer';
import 'package:app_cetis27/logica/actualizar_reporte.dart';
import 'package:app_cetis27/logica/aprobar_categoria.dart';
import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/cargar_categorias.dart';
import 'package:app_cetis27/logica/cargar_espacios.dart';
import 'package:app_cetis27/logica/categorias_pendientes.dart';
import 'package:app_cetis27/logica/eliminar_categoria.dart';
import 'package:app_cetis27/logica/eliminar_reporte.dart';
import 'package:app_cetis27/logica/fijar_estatus_reporte.dart';
import 'package:app_cetis27/logica/login.dart';
import 'package:app_cetis27/logica/modelos/categoria.dart';
import 'package:app_cetis27/logica/modelos/espacio.dart';
import 'package:app_cetis27/logica/modelos/reporte.dart';
import 'package:app_cetis27/logica/modelos/usuario.dart';
import 'package:app_cetis27/logica/nueva_categoria.dart';
import 'package:app_cetis27/logica/nuevo_reporte.dart';
import 'package:app_cetis27/logica/reportes_enviados.dart';
import 'package:app_cetis27/logica/reportes_recibidos.dart';
import 'package:app_cetis27/logica/subir_foto.dart';
import 'package:app_cetis27/logica/valores_activos.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_1.dart';
import 'package:app_cetis27/pantallas/componentes/componentes_statateful/desplegable_tipo_2.dart';
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
import 'package:app_cetis27/pantallas/pantalla_home_3.dart';
import 'package:app_cetis27/pantallas/pantalla_home_4.dart';
import 'package:app_cetis27/pantallas/pantalla_nueva_categoria.dart';
import 'package:app_cetis27/pantallas/pantalla_nueva_categoria_espacio.dart';
import 'package:app_cetis27/pantallas/pantalla_nuevo_reporte.dart';
import 'package:app_cetis27/pantallas/pantalla_reenviar_reporte_1.dart';
import 'package:app_cetis27/pantallas/pantalla_reenviar_reporte_2.dart';
import 'package:app_cetis27/pantallas/pantalla_reportes_enviados_2.dart';
import 'package:app_cetis27/pantallas/pantalla_reportes_recibidos_2.dart';
import 'package:app_cetis27/pantallas/pantalla_vista_categoria.dart';
import 'package:app_cetis27/pantallas/pantalla_vista_reporte_1.dart';
import 'package:app_cetis27/pantallas/pantalla_vista_reporte_2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Funciones {
  static void btn1Login(BuildContext context) {
    //Botón Tipo 1
    Login login =
        Login(Argumentos.argsLogin[0].text, Argumentos.argsLogin[1].text);
    Future<Usuario> usuarioRecibido = login.verify();
    usuarioRecibido.then(
      (futuro) {
        Usuario usuario = Usuario(
          futuro.existe,
          id: futuro.id,
          nombre: futuro.nombre,
          apellidoPaterno: futuro.apellidoPaterno,
          apellidoMaterno: futuro.apellidoMaterno,
          nivel: futuro.nivel,
          tipo: futuro.tipo,
        );

        if (usuario.existe) {
          ValoresActivos.usuario = usuario;

          if (usuario.tipo as int == 1) {
            Navigator.pushNamed(context, PantallaHome1.ruta);
          } else if (usuario.tipo as int == 2) {
            Navigator.pushNamed(context, PantallaHome2.ruta);
          } else if (usuario.tipo as int == 3) {
            CargarEspacios cargarEspacios = CargarEspacios();
            cargarEspacios.verificar().then((futuro) {
              ValoresActivos.espacio = futuro;
              Navigator.pushNamed(context, PantallaHome3.ruta);
            });
          } else if (usuario.tipo as int == 4) {
            Navigator.pushNamed(context, PantallaHome4.ruta);
          }
        } else {
          log('Usuario o contraseña incorrectos');
        }
      },
    );
  }

  static void btn1AgregarReporte(BuildContext context) {
    //Botón Tipo 1

    String foto = '';

    if (Argumentos.argsNuevoReporte.length == 2) {
      foto = 'ninguno';
    } else if (Argumentos.argsNuevoReporte.length == 3) {
      foto = Argumentos.argsNuevoReporte[2];
    }

    NuevoReporte nuevoReporte = NuevoReporte(
      Reporte(
        asunto: Argumentos.argsNuevoReporte[0].text,
        descripcion: Argumentos.argsNuevoReporte[1].text,
        foto: foto,
        usuario: ValoresActivos.usuario.id,
        categoria: Argumentos.argsCategoriaSeleccionada.id,
        espacio: Argumentos.argsEspacioSeleccionado.id,
        estatus: 'Pendiente',
      ),
    );

    Future<int> correcto = nuevoReporte.agregar();

    correcto.then(
      (futuro) {
        if (futuro == 0) {
          if (Argumentos.argsNuevoReporte.length == 3) {
            SubirFoto subirFoto = SubirFoto();
            subirFoto.subir();
          }

          Navigator.pop(context);
        } else {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: Center(
                  child: Text(
                    'Campos incompletos',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                height: 25,
                color: Colors.red,
              );
            },
          );
        }
      },
    );
  }

  static void btn1ActualizarReporte1(BuildContext context, int opcion) {
    //Botón Tipo 1

    String foto = '';

    if (Argumentos.argsNuevoReporte.length == 2) {
      foto = 'ninguno';
    } else if (Argumentos.argsNuevoReporte.length == 3) {
      foto = Argumentos.argsNuevoReporte[2];
    }

    ActualizarReporte actualizarReporte = ActualizarReporte(
      Reporte(
        id: Argumentos.argsReporteActual.id as int,
        asunto: Argumentos.argsNuevoReporte[0].text,
        descripcion: Argumentos.argsNuevoReporte[1].text,
        foto: foto,
        usuario: ValoresActivos.usuario.id,
        categoria: Argumentos.argsCategoriaSeleccionada.id,
        espacio: Argumentos.argsEspacioSeleccionado.id,
        estatus: 'Pendiente',
      ),
    );

    Future<int> correcto = actualizarReporte.actualizar();

    correcto.then(
      (futuro) {
        if (futuro == 0) {
          if (Argumentos.argsNuevoReporte.length == 3) {
            SubirFoto subirFoto = SubirFoto();
            subirFoto.subir();
          }

          PantallaReportesRecibidos2.listViewTipo1.actualizar!();

          if (opcion == 2) {
            Navigator.pop(context);
          }

          Navigator.pop(context);
        } else {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: Center(
                  child: Text(
                    'Campos incompletos',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                height: 25,
                color: Colors.red,
              );
            },
          );
        }
      },
    );
  }

  static void btn1ActualizarReporte2(BuildContext context, int opcion) {
    //Botón Tipo 1

    String foto = '';

    if (Argumentos.argsNuevoReporte.length == 2) {
      foto = 'ninguno';
    } else if (Argumentos.argsNuevoReporte.length == 3) {
      foto = Argumentos.argsNuevoReporte[2];
    }

    ActualizarReporte actualizarReporte = ActualizarReporte(
      Reporte(
        id: Argumentos.argsReporteActual.id as int,
        asunto: Argumentos.argsNuevoReporte[0].text,
        descripcion: Argumentos.argsNuevoReporte[1].text,
        foto: foto,
        usuario: ValoresActivos.usuario.id,
        categoria: Argumentos.argsCategoriaSeleccionada.id,
        espacio: Argumentos.argsEspacioSeleccionado.id,
        estatus: 'Pendiente',
      ),
    );

    Future<int> correcto = actualizarReporte.actualizar();

    correcto.then(
      (futuro) {
        if (futuro == 0) {
          if (Argumentos.argsNuevoReporte.length == 3) {
            SubirFoto subirFoto = SubirFoto();
            subirFoto.subir();
          }

          PantallaReportesEnviados2.listViewTipo2.actualizar!();

          if (opcion == 2) {
            Navigator.pop(context);
          }
          Navigator.pop(context);
        } else {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: Center(
                  child: Text(
                    'Campos incompletos',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                height: 25,
                color: Colors.red,
              );
            },
          );
        }
      },
    );
  }

  static void btn1AgregarCategoria(BuildContext context) {
    //Botón Tipo 1
    NuevaCategoria nuevaCategoria = NuevaCategoria(
      Categoria(
        nombre: Argumentos.argsNuevaCategoria[0].text,
        descripcion: Argumentos.argsNuevaCategoria[1].text,
        espacio: Argumentos.argsEspacioSeleccionado.id,
      ),
    );

    Future<int> correcto = nuevaCategoria.agregar();

    correcto.then(
      (futuro) {
        if (futuro == 0) {
          Navigator.pop(context);
          Navigator.pop(context);
        } else {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: Center(
                  child: Text(
                    'Campos incompletos',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                height: 25,
                color: Colors.red,
              );
            },
          );
        }
      },
    );
  }

  static void btn1AprobarCategoria(BuildContext context, int opcion) {
    //Botón Tipo 1
    AprobarCategoria aprobarCategoria =
        AprobarCategoria(Argumentos.argsCategoriaActual);
    if (Argumentos.argsCategoriaActual.tipo as int == 1) {
      aprobarCategoria.aprobarTipo1().then((futuro) {
        aprobarCategoria.eliminarPendiente().then((futuro) {
          PantallaCategoriasPendientes.listViewTipo3.actualizar!();
          Navigator.pop(context);
          if (opcion == 2) {
            Navigator.pop(context);
          }
        });
      });
    } else if (Argumentos.argsCategoriaActual.tipo as int == 2) {
      aprobarCategoria.aprobarTipo2().then((futuro) {
        aprobarCategoria.eliminarPendiente().then((futuro) {
          PantallaCategoriasPendientes.listViewTipo3.actualizar!();
          Navigator.pop(context);
          if (opcion == 2) {
            Navigator.pop(context);
          }
        });
      });
    } else {
      aprobarCategoria.aprobarTipo0().then((futuro) {
        aprobarCategoria.eliminarPendiente().then((futuro) {
          PantallaCategoriasPendientes.listViewTipo3.actualizar!();
          Navigator.pop(context);
          if (opcion == 2) {
            Navigator.pop(context);
          }
        });
      });
    }
  }

  static void btn1AgregarCategoriaEspacio(BuildContext context) {
    //Botón Tipo 1

    AprobarCategoria aprobarCategoria = AprobarCategoria(Categoria(
      nombre: Argumentos.argsNuevaCategoria[0].text,
      descripcion: Argumentos.argsNuevaCategoria[1].text,
      espacio: ValoresActivos.espacio.id,
    ));

    aprobarCategoria.aprobarTipo0().then((futuro) {
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  static void btn1IrPantallaAprobarCategoria2(BuildContext context) {
    //Botón Tipo 1
    Navigator.pushNamed(context, PantallaAprobarCategoria2.ruta);
  }

  static void btn1IrPantallaAprobarCategoria3(BuildContext context) {
    //Botón Tipo 1
    Navigator.pushNamed(context, PantallaAprobarCategoria3.ruta);
  }

  static void btn1ActualizarCategoria(BuildContext context) {
    //Botón Tipo 1
    AprobarCategoria aprobarCategoria =
        AprobarCategoria(Argumentos.argsCategoriaActual);
  }

  static void btn2IrPantallaNuevoReporte(BuildContext context) {
    //Botón Tipo 2

    Argumentos.argsEspacioSeleccionado = Espacio();
    Argumentos.argsCategoriaSeleccionada = Categoria();

    DesplegableTipo1.desplegableTipo1 =
        Componentes.getDesplegableTipo1(['Seleccione'], 'Seleccione');

    DesplegableTipo1.desplegableTipo2 =
        Componentes.getDesplegableTipo2(['Seleccione'], 'Seleccione');

    DesplegableTipo2.desplegableTipo3 =
        Componentes.getDesplegableTipo3(['Seleccione'], 'Seleccione');

    Navigator.pushNamed(context, PantallaNuevoReporte.ruta);
  }

  static void btn2IrPantallaNuevaCategoria(BuildContext context) {
    //Botón Tipo 2
    Navigator.pushNamed(context, PantallaNuevaCategoria.ruta);
  }

  static void btn2VerReportesRecibidos(BuildContext context) {
    //Botón Tipo 2
    if (ValoresActivos.usuario.tipo == 3) {
      ReportesRecibidos reportesRecibidos = ReportesRecibidos();
      reportesRecibidos.obtenerPorEspacio().then((futuro) {
        ReportesRecibidos.reportesRecibidos = futuro;
        Navigator.pushNamed(context, PantallaReportesRecibidos2.ruta);
      });
    }
  }

  static void btn2VerReportesEnviados(BuildContext context) {
    //Botón Tipo 2
    if (ValoresActivos.usuario.tipo == 3) {
      ReportesEnviados reportesEnviados = ReportesEnviados();
      reportesEnviados.obtenerPorUsuario().then((futuro) {
        ReportesEnviados.reportesEnviados = futuro;
        Navigator.pushNamed(context, PantallaReportesEnviados2.ruta);
      });
    }
  }

  static void btn2VerCategoriasPendientes(BuildContext context) {
    //Botón Tipo 2
    if (ValoresActivos.usuario.tipo == 3) {
      CategoriasPendientes categoriasPendientes = CategoriasPendientes();
      categoriasPendientes.obtenerPorEspacio().then((futuro) {
        CategoriasPendientes.categoriasPendientes = futuro;
        Navigator.pushNamed(context, PantallaCategoriasPendientes.ruta);
      });
    }
  }

  static void btn2VerCategorias(BuildContext context) {
    //Botón tipo 2

    if (ValoresActivos.usuario.tipo == 3) {
      CargarCategorias().obtenerPorEspacio().then((futuro) {
        CargarCategorias.categoriasEspacio = futuro;
        Navigator.pushNamed(context, PantallaCategorias.ruta);
      });
    }
  }

  static void btn2SeleccionarFoto(BuildContext context) {
    //Botón Tipo 2

    ImagePicker imagePicker = ImagePicker();
    Future<XFile?> file = imagePicker.pickImage(source: ImageSource.camera);

    file.then((futuro) {
      Argumentos.argsNuevoReporte.add(futuro!.name);
      Argumentos.argsFotoSeleccionada = futuro;
    });
  }

  static void btn2IrPantallaElegirNuevaCategoria(BuildContext context) {
    //Botón Tipo 2

    Navigator.pushNamed(context, PantallaElegirNuevaCategoria.ruta);
  }

  static void btn2IrPantallaNuevaCategoriaEspacio(BuildContext context) {
    //Botón Tipo 2

    Navigator.pushNamed(context, PantallaNuevaCategoriaEspacio.ruta);
  }

  static void btn3Logout(BuildContext context) {
    //Botón Tipo 3
    Argumentos.limpiar();
    ValoresActivos.usuario = Usuario(false);
    Navigator.pushNamed(context, '/');
  }

  static void btn4VerReporteRecibido(BuildContext context, Reporte reporte) {
    //Botón Tipo 4
    Argumentos.argsReporteActual = reporte;
    Navigator.pushNamed(context, PantallaVistaReporte1.ruta);
  }

  static void btn4VerReporteEnviado(BuildContext context, Reporte reporte) {
    //Botón Tipo 4
    Argumentos.argsReporteActual = reporte;
    Navigator.pushNamed(context, PantallaVistaReporte2.ruta);
  }

  static void btn4ReenviarReporte(
      BuildContext context, Reporte reporte, int opcion) {
    //Botón Tipo 4

    Argumentos.argsReporteActual = reporte;
    Argumentos.argsEspacioSeleccionado = Espacio();
    Argumentos.argsCategoriaSeleccionada = Categoria();

    DesplegableTipo1.desplegableTipo1 =
        Componentes.getDesplegableTipo1(['Seleccione'], 'Seleccione');
    DesplegableTipo1.desplegableTipo2 =
        Componentes.getDesplegableTipo2(['Seleccione'], 'Seleccione');
    DesplegableTipo2.desplegableTipo3 =
        Componentes.getDesplegableTipo3(['Seleccione'], 'Seleccione');

    if (opcion == 1) {
      Navigator.pushNamed(context, PantallaReenviarReporte1.ruta);
    } else if (opcion == 2) {
      Navigator.pushNamed(context, PantallaReenviarReporte2.ruta);
    }
  }

  static void btn4EditarReporte(
      BuildContext context, Reporte reporte, int opcion) {
    //Botón Tipo 4

    Argumentos.argsReporteActual = reporte;
    Argumentos.argsEspacioSeleccionado = Espacio();
    Argumentos.argsCategoriaSeleccionada = Categoria();

    DesplegableTipo1.desplegableTipo1 =
        Componentes.getDesplegableTipo1(['Seleccione'], 'Seleccione');
    DesplegableTipo1.desplegableTipo2 =
        Componentes.getDesplegableTipo2(['Seleccione'], 'Seleccione');
    DesplegableTipo2.desplegableTipo3 =
        Componentes.getDesplegableTipo3(['Seleccione'], 'Seleccione');

    if (opcion == 1) {
      Navigator.pushNamed(context, PantallaEditarReporte1.ruta);
    } else if (opcion == 2) {
      Navigator.pushNamed(context, PantallaEditarReporte2.ruta);
    }
  }

  static void btn4EliminarReporte(BuildContext context, int id, int opcion) {
    //Botón Tipo 4
    EliminarReporte eliminarReporte = EliminarReporte(id);
    if (opcion == 1) {
      eliminarReporte.eliminar().then((futuro) {
        PantallaReportesEnviados2.listViewTipo2.actualizar!();
      });
    } else if (opcion == 2) {
      eliminarReporte.eliminar().then((futuro) {
        PantallaReportesEnviados2.listViewTipo2.actualizar!();
        Navigator.pop(context);
      });
    }
  }

  static void btn4FijarStatusReporte(
      BuildContext context, int id, String estatus, int opcion) {
    //Botón Tipo 4
    FijarStatusReporte fijarStatusReporte = FijarStatusReporte(id, estatus);
    if (opcion == 1) {
      fijarStatusReporte.fijar().then((futuro) {
        PantallaReportesRecibidos2.listViewTipo1.actualizar!();
      });
    } else if (opcion == 2) {
      fijarStatusReporte.fijar().then((futuro) {
        PantallaReportesRecibidos2.listViewTipo1.actualizar!();
        Navigator.pop(context);
      });
    }
  }

  static void btn4IrPantallaAprobarCategoria(BuildContext context) {
    Navigator.pushNamed(context, PantallaAprobarCategoria1.ruta);
  }

  static void btn4IrPantallaEditarCategoria1(BuildContext context) {
    Navigator.pushNamed(context, PantallaEditarCategoria1.ruta);
  }

  static void btn4RechazarCategoria(BuildContext context) {
    AprobarCategoria aprobarCategoria =
        AprobarCategoria(Argumentos.argsCategoriaActual);
    aprobarCategoria.eliminarPendiente().then((futuro) {
      PantallaCategoriasPendientes.listViewTipo3.actualizar!();
    });
  }

  static void btn4IrPantallaVistaCategoria(BuildContext context) {
    Navigator.pushNamed(context, PantallaVistaCategoria.ruta);
  }

  static void btn4EliminarCategoria(BuildContext context, int id, int opcion) {
    //Botón Tipo 4
    EliminarCategoria eliminarCategoria = EliminarCategoria(id);
    if (opcion == 1) {
      eliminarCategoria.eliminar().then((futuro) {
        PantallaCategorias.listViewTipo4.actualizar!();
      });
    } else if (opcion == 2) {
      eliminarCategoria.eliminar().then((futuro) {
        PantallaCategorias.listViewTipo4.actualizar!();
        Navigator.pop(context);
      });
    }
  }

  static void btn4EditarCategoria(BuildContext context, int opcion) {
    //Botón Tipo 4

    Navigator.pushNamed(context, PantallaEditarCategoria2.ruta);
  }
}
