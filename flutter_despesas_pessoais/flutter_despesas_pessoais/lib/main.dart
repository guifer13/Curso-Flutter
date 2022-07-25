import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_despesas_pessoais/components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(
          secondary: Colors.amber,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transations = [
    Transaction(
        id: "t1", value: 310, title: "Tênis Novo", date: DateTime.now()),
    Transaction(
        id: "t2", value: 202, title: "Conta de água", date: DateTime.now()),
  ];

  _addtransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        value: value,
        title: title,
        date: DateTime.now());

    setState(() {
      _transations.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addtransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
        actions: [
          IconButton(
            onPressed: () => {_openTransactionFormModal(context)},
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              color: Colors.blue,
              child: Text("Gráfico!"),
              elevation: 5,
            ),
          ),
          TransactionList(_transations),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {_openTransactionFormModal(context)},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
