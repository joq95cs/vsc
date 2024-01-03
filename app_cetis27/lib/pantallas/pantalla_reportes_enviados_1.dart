import 'package:app_cetis27/logica/modelos/reporte.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:app_cetis27/pantallas/temporal/reportes.dart';
import 'package:flutter/material.dart';

class PantallaReportesEnviados1 extends StatelessWidget {
  static String ruta = '/pantallaReportesEnviados1';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Componentes.getBarraSuperior('Reportes enviados'),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Componentes.getDesplegableTipo1(
                  ['Propios', 'Departamento', 'Todos'],
                  'Propios',
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Reportes.enviados.length,
                itemBuilder: (context, index) {
                  return Componentes.getCardTipo5(Reporte());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
