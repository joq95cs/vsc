import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/logica/constantes.dart';
import 'package:flutter/material.dart';

//FOTO
class CardTipo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
            "${Constantes.SERVER_URL}/curso_php/cetis_27/${Argumentos.argsReporteActual.foto as String}"),
      ),
    );
  }
}
