import 'package:expense_tracker/common/widgets/gradient_container.dart';
import 'package:expense_tracker/data/colors.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(title: 'Flutter Course', amount: 19.99, date: DateTime.now(), category: Category.work),
    Expense(title: 'Cinema', amount: 15.69, date: DateTime.now(), category: Category.leisure),
  ];

  void _openAddExpenseDialog() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(_addNewExpense),
    ).then((value) => {
          if (value != null && value is Expense)
            {
              setState(() {
                _registeredExpenses.add(value);
              })
            }
        });
  }

  void _addNewExpense(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Flutter ExpensesTracker'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _openAddExpenseDialog,
            ),
          ],
        ),
        body: GradientContainer.linear(
          gradientColors: gradientColorsMainBackground,
          child: Column(
            children: [
              const Text('The Chart'),
              Expanded(
                child: ExpensesList(_registeredExpenses, _removeExpense),
              ),
            ],
          ),
        ),
      );
}
