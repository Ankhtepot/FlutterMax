import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list/providers/groceries_privider.dart';
import 'package:shopping_list/widgets/grocery_list/grocery_list_item.dart';

class GroceryList extends ConsumerWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceryItems = ref.read(groceriesProvider);

    return ListView.builder(
      itemCount: groceryItems.length,
      itemBuilder: (context, index) {
        final item = groceryItems[index];
        return GroceryListItem(item);
      },
    );
  }
}
