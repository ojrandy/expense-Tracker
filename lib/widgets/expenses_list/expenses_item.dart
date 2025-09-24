import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});



  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(expense.title),
        subtitle: Text(expense.date.toString()),
        trailing: Text('\$${expense.amount.toStringAsFixed(2)}'),
      ),
    );
  }
}
