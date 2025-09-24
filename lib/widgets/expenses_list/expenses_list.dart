import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        final expense = expenses[index];
        return Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),

                // This is a row because we want to display the amount and date side by side
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${expense.amount.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),

                    // We will try to use a dynamic icon based on the Category
                    Row(
                      spacing: 4,
                      children: [
                        Icon(
                          categoryIcons[expense.category],
                          size: 14,
                          color: const Color.fromARGB(255, 24, 23, 23),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          expense.category.name,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    // This is the formated date from intl
                    Row(
                      spacing: 4,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: const Color.fromARGB(255, 15, 15, 15),
                        ),
                        Text(
                          DateFormat('MMM d, y').format(expense.date),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 8, 8, 8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
