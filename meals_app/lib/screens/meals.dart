import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class Meals extends StatelessWidget {
  const Meals(this.title, this.meals, {super.key});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: meals.isNotEmpty
          ? ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index];
                return ListTile(
                  tileColor: Colors.white,
                  title: Text(meal.title),
                  onTap: () {
                    print('Meals: ${meal.title}');
                  },
                );
              },
            )
          : const Card(
              child: Center(
                child: Text('No meals found.'),
              ),
            ),
    );
  }
}
