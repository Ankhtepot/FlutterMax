import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';

final Provider<MealsProvider> mealsProvider = Provider<MealsProvider>((ref) {
  return MealsProvider();
});

class MealsProvider {
  final List<Meal> meals = dummyMeals;
}
