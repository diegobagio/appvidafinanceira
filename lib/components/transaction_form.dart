import 'package:flutter/material.dart';

import '../enums/tipo.dart';

class TransactionForm extends StatelessWidget {

  final itemController = TextEditingController();
  final valorController = TextEditingController();
  Tipo _tipo = Tipo.RECEBIDO;


  final void Function(String, double, Tipo) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm() {
    final title = itemController.text;
    final value = double.tryParse(valorController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    onSubmit(title, value, _tipo );
  }

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: const Text('Dog'),
              leading: Radio<Tipo>(
                fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
                focusColor: MaterialStateColor.resolveWith((states) => Colors.green),
                value: Tipo.RECEBIDO,
                groupValue: _tipo,
                onChanged: (_) {},
                // onChanged: (Tipo value) {
                //   setState(() {
                //     _tipo = value;
                //   });
                // },
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Título'),
              controller: itemController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
              controller: valorController,
              onSubmitted: (_) => _submitForm(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
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