import 'package:favorite_places/general/navigation_helper.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});
  static const routeName = '/places-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              navigateTo(context, (ctx) => const AddPlaceScreen());
            },
          ),
        ],
      ),
      body: const Center(
        child: PlacesList(places: []),
      ),
    );
  }
}
