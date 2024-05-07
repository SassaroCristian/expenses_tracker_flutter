import 'package:expenses_tracker_flutter/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker_flutter/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerdExpenses = [
    Expense(
      title: 'Gas',
      amount: 9.99,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Grass',
      amount: 15,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'cheese',
      amount: 0,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];
  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child: ExpensesList(
              expenses: _registerdExpenses,
            ),
          )
        ],
      ),
    );
  }
}
