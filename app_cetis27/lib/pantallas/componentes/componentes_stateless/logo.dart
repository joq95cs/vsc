import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Image(
        image: AssetImage('assets/img/logo.gif'),
        width: 250,
      ),
    );
  }
}
