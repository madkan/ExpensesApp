import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addnewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
