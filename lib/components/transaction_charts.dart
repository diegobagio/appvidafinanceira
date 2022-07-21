import 'package:appvidafinanceira/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionCharts extends StatelessWidget {
  final List<Transaction> transactions;
  final bool animate;

  TransactionCharts(this.transactions, {required this.animate});


  // factory TransactionCharts.withSampleData() {
  //   return new TransactionCharts(
  //     // _createSampleData(),
  //     // Disable animations for image tests.
  //     animate: false,
  //   );
  // }

  // static List<charts.Series<Transaction, String>> _createSampleData() {
  //   return []
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}
