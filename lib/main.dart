import 'package:ExpensesApp/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExpensesApp());
}

//class ExpensesApp extends StatefulWidget {
//  State<StatefulWidget> createstate() {
//    return _ExpensesAppState();
//  }
//}

class ExpensesApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //String textInput;
  //String amountInput;
  final textControl = TextEditingController();
  final amountControl = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ExpensesApp'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                color: Colors.blueAccent,
                child: Container(
                  width: double.infinity,
                  child: Text('CHART 1'),
                ),
                elevation: 5,
              ),
              UserTransaction(),
            ],
          ),
        ));
  }
}
