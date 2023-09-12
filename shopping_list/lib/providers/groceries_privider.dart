import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/data/http_data.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:http/http.dart' as http;

final groceriesProvider =
    StateNotifierProvider<GroceriesItemsProvider, List<GroceryItem>>((ref) => GroceriesItemsProvider());

class GroceriesItemsProvider extends StateNotifier<List<GroceryItem>> {
  GroceriesItemsProvider() : super(groceryItems);

  set setItems(List<GroceryItem> items) {
    state = items;
  }

  Future<Response> add(GroceryItem item) async {
    return await http.post(Uri.https(firebaseRoot, shoppingListJson),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'name': item.name,
          'quantity': item.quantity,
          'category': item.category.title,
        }));
  }

  Future<Response> remove(GroceryItem item) async {
    final url = Uri.https(firebaseRoot, '$shoppingListJson/${item.id}.json');
    await http.delete(url);
    return await loadItemsAsync();
  }

  void update(GroceryItem item) {
    state = [
      for (final groceryItem in state)
        if (groceryItem.id == item.id) item else groceryItem
    ];
  }

  Future<Response> loadItemsAsync() async {
    final url = Uri.https(firebaseRoot, shoppingListJson);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final List<GroceryItem> loadedItems = [];

      data.forEach((key, value) {
        loadedItems.add(
          GroceryItem(
            id: key,
            name: value['name'],
            quantity: value['quantity'],
            category: categories.entries.firstWhere((element) => element.value.title == value['category']).value,
          ),
        );
      });

      state = loadedItems;
    }

    return response;
  }
}
