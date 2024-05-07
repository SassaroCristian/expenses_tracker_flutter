import 'package:expenses_tracker_flutter/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpanse extends StatefulWidget {
  const NewExpanse({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpanse> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Title'),
            ),
          ),
        ],
      ),
    );
  }
}
