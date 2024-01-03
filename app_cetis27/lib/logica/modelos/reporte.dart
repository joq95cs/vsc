import 'package:flutter/material.dart';

class Reporte {
  int? id;
  String? asunto;
  String? descripcion;
  String? foto;
  String? fecha;
  int? usuario;
  int? categoria;
  int? espacio;
  String? estatus;
  Icon? icono;

  Reporte({
    this.id,
    this.asunto,
    this.descripcion,
    this.foto,
    this.fecha,
    this.usuario,
    this.categoria,
    this.espacio,
    this.estatus,
  });
}
