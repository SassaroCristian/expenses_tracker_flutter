import 'package:expenses_tracker_flutter/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker_flutter/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;

  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Colors.red,
          // margin: EdgeInsets.symmetric(
          //   horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          // ),
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 50,
          ),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
