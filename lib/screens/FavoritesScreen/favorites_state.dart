import 'package:flutter/material.dart';

class FavoritesState with ChangeNotifier {
  final Map<String, Map<String, dynamic>> _favorites = {};

  Map<String, Map<String, dynamic>> get favorites => _favorites;

  void toggleFavorite(String eventName, Map<String, dynamic> eventDetails) {
    if (_favorites.containsKey(eventName)) {
      _favorites.remove(eventName);
    } else {
      _favorites[eventName] = eventDetails;
    }
    notifyListeners();
  }
}

final FavoritesState favoritesState = FavoritesState();
