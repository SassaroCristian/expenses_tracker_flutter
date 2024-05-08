import 'package:expenses_tracker_flutter/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_tracker_flutter/widgets/new_expense.dart';
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

  void _openAddOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpanse(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerdExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registerdExpenses.remove(expense);
    });
  }

  @override
  Widget build(context) {
    Widget mainContent = const Center(
      child: Text('No expenses found, add some!!'),
    );

    if (_registerdExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerdExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My expenses'),
        actions: [
          IconButton(
            onPressed: _openAddOverlay,
            icon: const Icon(Icons.add),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green),
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 53, 123, 55),
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }
}
