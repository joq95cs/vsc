import 'package:flutter/material.dart';

class Reportes {
  String asunto;
  String descripcion;
  Icon icono;
  Reportes(this.asunto, this.descripcion, this.icono);

  static List<Reportes> enviados = [
    Reportes('Asunto del reporte 1', 'Esta es la descripción del reporte no. 1',
        Icon(Icons.check, color: Colors.green)),
    Reportes('Asunto del reporte 2', 'Esta es la descripción del reporte no. 1',
        Icon(Icons.access_time_filled, color: Colors.amber)),
    Reportes('Asunto del reporte 3', 'Esta es la descripción del reporte no. 1',
        Icon(Icons.cancel, color: Colors.red)),
    Reportes('Asunto del reporte 4', 'Esta es la descripción del reporte no. 1',
        Icon(Icons.check, color: Colors.green)),
    Reportes('Asunto del reporte 5', 'Esta es la descripción del reporte no. 1',
        Icon(Icons.cancel, color: Colors.red)),
    Reportes('Asunto del reporte 6', 'Esta es la descripción del reporte no. 1',
        Icon(Icons.check, color: Colors.green)),
  ];

  static List<Reportes> recibidos = [
    Reportes(
        'Asunto del reporte 1',
        'Esta es la descripción del reporte no. 1',
        Icon(
          Icons.warning,
          color: Colors.amber,
        )),
    Reportes(
        'Asunto del reporte 2',
        'Esta es la descripción del reporte no. 2',
        Icon(
          Icons.warning,
          color: Colors.amber,
        )),
    Reportes(
        'Asunto del reporte 3',
        'Esta es la descripción del reporte no. 3',
        Icon(
          Icons.warning,
          color: Colors.amber,
        )),
    Reportes(
        'Asunto del reporte 4',
        'Esta es la descripción del reporte no. 4',
        Icon(
          Icons.warning,
          color: Colors.amber,
        )),
    Reportes(
        'Asunto del reporte 5',
        'Esta es la descripción del reporte no. 5',
        Icon(
          Icons.warning,
          color: Colors.amber,
        )),
    Reportes(
        'Asunto del reporte 6',
        'Esta es la descripción del reporte no. 6',
        Icon(
          Icons.warning,
          color: Colors.amber,
        )),
  ];
}
