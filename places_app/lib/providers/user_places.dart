import 'dart:io';

import 'package:favorite_places/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:favorite_places/models/place.dart';

Future<Database> _getDatabase() async {
  String dbPath = await sql.getDatabasesPath();
  return sql.openDatabase(path.join(dbPath, dbFileName), onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE $dbTableName(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL, address TEXT)',
    );
  }, version: 1);
}

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  Future<void> loadPlaces() async {
    Database db = await _getDatabase();

    final List<Map<String, dynamic>> placesList = await db.query(dbTableName);

    state = placesList.map((place) => Place(
        id: place['id'] as String,
        title: place['title'] as String,
        image: File(place['image'] as String),
        location: PlaceLocation(
          latitude: place['lat'] as double,
          longitude: place['lng'] as double,
          address: place['address'] as String,
        ),
      )).toList();
  }

  void addPlace(String title, File image, PlaceLocation location) async {
    final Directory appDir = await syspaths.getApplicationDocumentsDirectory();
    final String fileName = path.basename(image.path);
    final File copiedImage = await image.copy('${appDir.path}/$fileName');

    final Place newPlace = Place(title: title, image: copiedImage, location: location);

    Database db = await _getDatabase();

    db.insert(dbTableName, {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'lat': newPlace.location.latitude,
      'lng': newPlace.location.longitude,
      'address': newPlace.location.address
    });

    state = [newPlace, ...state];
  }
}

final userPlacesProvider = StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier(),
);
