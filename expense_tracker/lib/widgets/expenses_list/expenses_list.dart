import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expenses, this.onExpenseDismissed, {super.key});

  final List<Expense> expenses;
  final void Function(Expense) onExpenseDismissed;

  List<Widget> buildExpenses() {
    List<Widget> result = [];

    return result;
  }

  @override
  Widget build(context) => ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
            key: ValueKey(expenses[index]),
            child: ExpenseItem(expenses[index]),
            onDismissed: (direction) => onExpenseDismissed(expenses[index]),
          ));
}
