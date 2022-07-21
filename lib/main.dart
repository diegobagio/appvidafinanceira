import 'dart:math';

import 'package:appvidafinanceira/components/transaction_charts.dart';
import 'package:appvidafinanceira/components/transaction_form.dart';
import 'package:appvidafinanceira/components/transaction_list.dart';
import 'package:appvidafinanceira/enums/tipo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';

void main() => runApp(VidaFinanceira());

class VidaFinanceira extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vida Financeira',
      theme: ThemeData(
        colorScheme: tema.colorScheme
            .copyWith(primary: Colors.black87, secondary: Colors.blueAccent),
        textTheme: tema.textTheme.copyWith(
            headline6: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        scaffoldBackgroundColor: Colors.white10,
        appBarTheme: AppBarTheme(
            color: Colors.black87,
            titleTextStyle:
            TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
    Transaction(
        BigInt.from(1), 'Fatura Água', 408.7, DateTime.now(), Tipo.PAGO),
    Transaction(
        BigInt.from(2), 'Salário', 3238.35, DateTime.now(), Tipo.RECEBIDO),
  ];

  _addTransaction(String title, double value, DateTime date, Tipo tipo) {
    //Metodo para adicionar uma transação
    final newTransaction =
    Transaction(BigInt.from(Random().nextInt(3)), title, value, date, tipo);
    setState(() {
      _transactions.add(newTransaction);
    });

    //Metodo para fechar o modal
    Navigator.of(context).pop();
  }

  //Abrir modal para lançar nova transação
  _openTransactionFormModal(BuildContext context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery
                              .of(context)
                              .viewInsets
                              .bottom),
                      child: TransactionForm(_addTransaction),
                    ),
                  ]
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Minha Vida Financeira'),
            actions: [
              IconButton(
                  onPressed: () => _openTransactionFormModal(context),
                  icon: Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 223, 120, 0),
                  ))
            ],
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.attach_money),
                ),
                Tab(
                  icon: Icon(Icons.bar_chart_sharp),
                ),
                Tab(
                  icon: Icon(Icons.brightness_5_sharp),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TransactionList(_transactions),
                        ],
                      ),
                )
              ),
              Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TransactionCharts(_transactions),
                      ],
                    ),
                  )
              ),
              Center(
                child: Text("It's sunny here"),
              ),
            ],
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
                  colors: [
                    Color.fromARGB(255, 255, 200, 200),
                    Color.fromARGB(255, 223, 120, 0),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
