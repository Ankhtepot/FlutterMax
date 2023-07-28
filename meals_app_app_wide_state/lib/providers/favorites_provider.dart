import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

final StateNotifierProvider<FavoriteMealsNotifier, List<Meal>> favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) => FavoriteMealsNotifier());

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoritesStatus(Meal targetMeal) {
    if (state.contains(targetMeal)) {
      state.remove(targetMeal);
      return false;
    } else {
      state.add(targetMeal);
      return true;
    }

    // final mealIsFavorite = state.contains(targetMeal);

    // if (mealIsFavorite) {
    //   state = state.where((meal) => meal.id != targetMeal.id).toList();
    //   return false;
    // } else {
    //   state = [...state, targetMeal];
    //   return true;
    // }
  }
}
