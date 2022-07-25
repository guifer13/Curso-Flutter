import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario; 

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if(pontuacao < 8) {
      return "Regular!";
    } else {
      return "Bom!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado),
        ),
        ElevatedButton(onPressed: quandoReiniciarQuestionario, child: Text("Reiniciar?"))
      ],
    );
  }
}
