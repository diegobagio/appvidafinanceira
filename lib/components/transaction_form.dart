import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../enums/tipo.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime, Tipo) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final itemController = TextEditingController();
  final dateController = TextEditingController();
  final valorController = TextEditingController();

  Tipo _tipo = Tipo.RECEBIDO;

  _submitForm() {
    final title = itemController.text;
    final value = double.tryParse(valorController.text) ?? 0.0;
    final date =   new DateFormat('dd/MM/yyyy').parse(dateController.text);

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value, date, _tipo);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
              //editing controller of this TextField
              decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "Selecione a Data" //label text of field
                  ),
              // readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                  setState(() {
                    dateController.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {
                  dateController.text =
                      DateFormat('dd/MM/yyyy').format(DateTime.now());
                }
              },
              controller: dateController,
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
                          MaterialStateProperty.all<Color>(Colors.black26)),
                  child: Text(
                    'Nova Transação',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        // shadows: [
                        //   Shadow(
                        //       offset: Offset(3.0, 3.0),
                        //       blurRadius: 3.0,
                        //       color: Color.fromARGB(255, 0, 0, 0))
                        // ],
                    ),
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
