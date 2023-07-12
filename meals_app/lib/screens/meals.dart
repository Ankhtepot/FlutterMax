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
                  tileColor: Color.fromARGB(255, 255 - index * 5, 255 - index * 5, 255 - index * 5),
                  title: Text(meal.title),
                  onTap: () {
                    print('Meals: ${meal.title}');
                  },
                );
              },
            )
          : Card(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'No meals found.',
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Try selecting different category',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
