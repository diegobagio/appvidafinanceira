import 'package:flutter/material.dart';

import '../enums/tipo.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, Tipo) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final itemController = TextEditingController();

  final valorController = TextEditingController();

  Tipo _tipo = Tipo.RECEBIDO;

  _submitForm() {
    final title = itemController.text;
    final value = double.tryParse(valorController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value, _tipo);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Radio(
                        value: Tipo.RECEBIDO,
                        groupValue: _tipo,
                        onChanged: (value) {
                          setState(() {
                            _tipo = Tipo.RECEBIDO;
                          });
                        }),
                    Text(Tipo.RECEBIDO.descricao)
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: Tipo.PAGO,
                        groupValue: _tipo,
                        onChanged: (value) {
                          setState(() {
                            _tipo = Tipo.PAGO;
                          });
                        }),
                    Text(Tipo.PAGO.descricao)
                  ],
                ),
              ],
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
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple)),
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
