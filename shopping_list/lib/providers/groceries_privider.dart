import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';

final groceriesProvider =
    StateNotifierProvider<GroceriesItemsProvider, List<GroceryItem>>((ref) => GroceriesItemsProvider());

class GroceriesItemsProvider extends StateNotifier<List<GroceryItem>> {
  GroceriesItemsProvider() : super(groceryItems);

  void add(GroceryItem item) {
    state = [...state, item];
  }

  void remove(GroceryItem item) {
    state = state.where((element) => element.id != item.id).toList();
  }

  void update(GroceryItem item) {
    state = [
      for (final groceryItem in state)
        if (groceryItem.id == item.id) item else groceryItem
    ];
  }
}
