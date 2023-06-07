import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expenses, {super.key});

  final List<Expense> expenses;

  List<Widget> buildExpenses() {
    List<Widget> result = [];

    return result;
  }

  @override
  Widget build(context) => SizedBox(
        height: 300,
        child: ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (context, index) => Text(
            expenses[index].title,
          ),
        ),
      );
}
