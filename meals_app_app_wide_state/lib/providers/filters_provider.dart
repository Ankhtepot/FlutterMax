import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/meals_provider.dart';

final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<EFilter, bool>>((ref) {
  return FiltersNotifier();
});

const kInitialFilters = {
  EFilter.glutenFree: false,
  EFilter.lactoseFree: false,
  EFilter.vegetarian: false,
  EFilter.vegan: false
};

enum EFilter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<EFilter, bool>> {
  FiltersNotifier() : super(kInitialFilters);

  void setFilter(EFilter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }

  void setFilters(Map<EFilter, bool> filters) {
    state = filters;
  }
}

final filteredMealsProvider = Provider<List<Meal>>((ref) {
  final Map<EFilter, bool> filters = ref.watch(filtersProvider);
  final List<Meal> meals = ref.watch(mealsProvider);

  return meals.where((meal) {
    if (filters[EFilter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (filters[EFilter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (filters[EFilter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (filters[EFilter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
