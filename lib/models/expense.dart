/*
  *Documentation:

  This file contains the Expense class and related constants for managing expenses.

  The Expense class represents an expense entity with properties such as title, amount, date,
  and category. It also provides methods for formatting date and generating unique IDs.

  *Category: 
  An enumeration representing different expense categories including food, travel,
  leisure, and work.

  categoryIcons: A map linking each expense category to its corresponding icon.

  *Expense Class Properties:
  - id: Unique identifier for the expense.
  - title: Title of the expense.
  - amount: Amount of the expense.
  - date: Date of the expense.
  - category: Category of the expense.

  *Expense Class Methods:
  - formattedDate: Method to format the date of the expense.

  *Example usage:
  - Creating an Expense object:
    Expense(
      title: 'Dinner',
      amount: 50.0,
      date: DateTime.now(),
      category: Category.food,
    )

  !Note:
*/

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_land,
  Category.leisure: Icons.movie,
  Category.work: Icons.work_rounded,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  get formattedDate {
    return formatter.format(date);
  }
}
