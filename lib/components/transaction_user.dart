import 'package:appvidafinanceira/components/transaction_form.dart';
import 'package:appvidafinanceira/components/transaction_list.dart';
import 'package:appvidafinanceira/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(BigInt.from(1), 'Fatura Água', 408.7, DateTime.now()),
    Transaction(BigInt.from(2), 'Fatura Energia', 238.35, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(),
      ],
    );
  }
}
