import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';

final Provider<List<Meal>> mealsProvider = Provider<List<Meal>>((ref) {
  return MealsProvider().meals;
});

class MealsProvider {
  final List<Meal> meals = dummyMeals;
}
