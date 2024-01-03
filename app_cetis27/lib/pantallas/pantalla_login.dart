import 'package:app_cetis27/logica/argumentos.dart';
import 'package:app_cetis27/pantallas/componentes/componentes.dart';
import 'package:flutter/material.dart';

class PantallaLogin extends StatelessWidget {
  static String ruta = '/pantallaLogin';
  TextEditingController _controladorUser = TextEditingController();
  TextEditingController _controladorPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Argumentos.argsLogin = [_controladorUser, _controladorPass];
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            color: Color(0xFFfafafa),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Componentes.getLogo(),
                Componentes.getCampoTextoTipo1(
                  'Usuario',
                  Icon(Icons.person_outline),
                  false,
                  _controladorUser,
                ),
                Componentes.getCampoTextoTipo1(
                  'Contraseña',
                  Icon(Icons.lock_outline),
                  false,
                  _controladorPass,
                ),
                Componentes.getBotonTipo1('INICIAR SESIÓN', 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
