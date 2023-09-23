import 'package:favorite_places/models/place.dart';

String _mapsApiKey = 'asmdf95AIzaSyAIguJnqasmdf95-jfoQH1okwi48i37rvLbGHq2eQ';

String get mapsApiKey => _mapsApiKey.replaceAll('asmdf95', '');

String dbFileName = 'places.db';
String dbTableName = 'user_places';

const PlaceLocation defaultLocation = PlaceLocation(
  latitude: 37.422,
  longitude: -122.084,
  address: 'Google Plex',
);
