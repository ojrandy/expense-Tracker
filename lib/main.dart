import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const Expenses(),
    ),
  );
}
