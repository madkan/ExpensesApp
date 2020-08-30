import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expenses',
      home: ExpensesApp(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}

class ExpensesApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _ExpensesAppState();
  }
}

class _ExpensesAppState extends State<ExpensesApp> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'new shoes',
      amount: 1670,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'watch',
      amount: 2550,
      date: DateTime.now(),
    ),
  ];

  void _addnewTransaction(String txTitle, double txAmount) {
    final newtx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransaction.add(newtx);
    });
  }

  void _openAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addnewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openAddNewTransaction(context),
          )
        ],
      ),
      body: Column(children: [
        SingleChildScrollView(
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
            ],
          ),
        ),
        TransactionList(_userTransaction),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openAddNewTransaction(context),
      ),
    );
  }
}
