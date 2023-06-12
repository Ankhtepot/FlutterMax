import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Date'),
          ),
          Row(
            children: [
              Text('No date chosen'),
              TextButton(
                onPressed: () {},
                child: const Text('Choose date'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Add expense'),
          ),
        ],
      ));
}
