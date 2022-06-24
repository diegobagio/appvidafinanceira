import 'dart:math';

import 'package:appvidafinanceira/components/transaction_form.dart';
import 'package:appvidafinanceira/components/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() => runApp(VidaFinanceira());

class VidaFinanceira extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vida Financeira',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
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
  final _transactions = [
    Transaction(BigInt.from(1), 'Fatura Água', 408.7, DateTime.now()),
    Transaction(BigInt.from(2), 'Fatura Energia', 238.35, DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(BigInt.from(Random().nextInt(2)), title, value, DateTime.now());
  }

  _openTransactionFormModal(BuildContext context) {
    return showModalBottomSheet(context: context, builder: (_) {
      return TransactionForm(_addTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        actions: [
          IconButton(onPressed: () => _openTransactionFormModal(context), icon: Icon(Icons.add))
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
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
