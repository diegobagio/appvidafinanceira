import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  final itemController = TextEditingController();
  final valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Título'),
              controller: itemController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
              controller: valorController,
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.purple)),
                  child: Text(
                    'Nova Transação',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        shadows: [
                          Shadow(
                              offset: Offset(3.0, 3.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0))
                        ]),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
