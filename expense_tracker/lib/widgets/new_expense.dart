import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(context) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const TextField(
            maxLength: 50,
            decoration: InputDecoration(labelText: 'Title'),
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
