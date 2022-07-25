import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Respostas(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: quandoSelecionado,
          child: Text(texto),
        ));
  }
}
