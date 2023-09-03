import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';

final groceriesProvider = Provider<List<GroceryItem>>((ref) => groceryItems);
