import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControl = TextEditingController();

  final amountControl = TextEditingController();

  void submitData() {
    final enteredText = titleControl.text;
    final enteredAmount = double.parse(amountControl.text);
    if (enteredText.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(
      enteredText,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleControl,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              //onChanged: (value) => textInput = value,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountControl,
              onSubmitted: (_) => submitData(),
              //onChanged: (value) => amountInput = value,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
