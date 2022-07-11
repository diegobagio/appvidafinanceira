import '../enums/tipo.dart';

class Transaction {
  final BigInt id;
  final String title;
  final double value;
  final DateTime date;
  final Tipo tipo;


  Transaction(this.id, this.title, this.value, this.date, this.tipo);
}