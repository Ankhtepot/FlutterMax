import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expenses, {super.key});

  final List<Expense> expenses;

  List<Widget> buildExpenses() {
    List<Widget> result = [];

    return result;
  }

  @override
  Widget build(context) => ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (context, index) => ExpenseItem(expenses[index])
          );
}
