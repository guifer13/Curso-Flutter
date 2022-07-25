import 'package:flutter/material.dart';
import 'package:flutter_perguntas/questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _PerguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _pergunta = [
    {
      "texto": "Qual sua cor favorita?",
      "respostas": [
        {"texto": "preto", "nota": 10},
        {"texto": "vermelho", "nota": 8},
        {"texto": "amarelo", "nota": 6},
        {"texto": "verde", "nota": 3},
      ],
    },
    {
      "texto": "Qual seu animal favorito?",
      "respostas": [
        {"texto": "cão", "nota": 10},
        {"texto": "galinha", "nota": 8},
        {"texto": "coelho", "nota": 6},
        {"texto": "gato", "nota": 3},
      ],
    },
    {
      "texto": "Qual seu peixe favorito?",
      "respostas": [
        {"texto": "piau", "nota": 10},
        {"texto": "pacu", "nota": 8},
        {"texto": "piranha", "nota": 6},
        {"texto": "pintado", "nota": 3},
      ],
    }
  ];

  void _responder(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
        _PerguntaSelecionada++;
        _pontuacaoTotal += nota;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
     _PerguntaSelecionada = 0;
    _pontuacaoTotal = 0;
    });

  }

  bool get temPerguntaSelecionada {
    return _PerguntaSelecionada < _pergunta.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _pergunta,
                perguntaSelecionada: _PerguntaSelecionada,
                responder: _responder)
            : Resultado(_pontuacaoTotal,_reiniciarQuestionario),
      ),
    );
  }
}
