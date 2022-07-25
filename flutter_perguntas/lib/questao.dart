import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String Texto;
  const Questao(this.Texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        Texto,
        style: TextStyle(
          fontSize: 28,  
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
