import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _toggleMealFavorite(Meal meal) => setState(() {
        final isExisting = _favoriteMeals.contains(meal);

        if (isExisting) {
          setState(() {
            _showInfoMessage('Removed ${meal.title} from favorites');
            _favoriteMeals.remove(meal);
          });
        } else {
          setState(() {
            _showInfoMessage('Added ${meal.title} to favorites');
            _favoriteMeals.add(meal);
          });
        }
      });

  void _selectPage(int index) => setState(() {
        _selectedPageIndex = index;
      });

  void _setScreen(String identifier) {
    if (identifier == 'filters') {
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(_toggleMealFavorite);
    String activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePageTitle = 'Your Favorites';
      activePage = MealsScreen(_favoriteMeals, _toggleMealFavorite);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle),
        ),
        drawer: MainDrawer(_setScreen),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
        ));
  }
}
