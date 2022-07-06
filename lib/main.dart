import 'dart:math';

import 'package:appvidafinanceira/components/transaction_form.dart';
import 'package:appvidafinanceira/components/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'models/transaction.dart';

void main() => runApp(VidaFinanceira());

class VidaFinanceira extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();

    return MaterialApp(
      title: 'Vida Financeira',
      theme: ThemeData(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.black87,
          secondary: Colors.blueAccent
        ),
        textTheme: tema.textTheme.copyWith(
          headline6: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black
          )
        ),
        scaffoldBackgroundColor: Colors.white10,
        appBarTheme: AppBarTheme(
          color: Colors.black87,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Lista de Transações
  final _transactions = [
    Transaction(BigInt.from(1), 'Fatura Água', 408.7, DateTime.now()),
    Transaction(BigInt.from(2), 'Fatura Energia', 238.35, DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    //Metodo para adicionar uma transação
    final newTransaction = Transaction(BigInt.from(Random().nextInt(3)), title, value, DateTime.now());
    setState(() {
      _transactions.add(newTransaction);
    });

    //Metodo para fechar o modal
    Navigator.of(context).pop();
  }

  //Abrir modal para lançar nova transação
  _openTransactionFormModal(BuildContext context) {
    return showModalBottomSheet(context: context, builder: (_) {
      return TransactionForm(_addTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Vida Financeira'),
        actions: [
          IconButton(onPressed: () => _openTransactionFormModal(context), icon: Icon(Icons.add, color: Color.fromARGB(255, 223,120, 0),))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Card(
                elevation: 5,
                child: Text('Grafico'),
              ),
            ),
            Column(
              children: [
                TransactionList(_transactions),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        tooltip: 'Cool FAB',
        child: Container(
          width: 56,
          height: 56,
          child: Icon(Icons.add),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              center: const Alignment(-0.7, -0.5),
              radius: 0.28,
              colors: [ Color.fromARGB(255, 255,200, 200), Color.fromARGB(255, 223,120, 0),],
            ),
          ),
        ),
      ),
    );
  }
}
