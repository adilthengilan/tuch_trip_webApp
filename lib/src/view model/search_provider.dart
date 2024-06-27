import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  List<dynamic> foundHotels = [];

  void runSearching(String enteringKey, hotels) {
    List result = [];

    if (enteringKey.isEmpty) {
      result = result;
    } else {
      result = hotels
          .where((hotel) => hotel
              .toString()
              .toLowerCase()
              .contains(enteringKey.toLowerCase()))
          .toList();
    }

    foundHotels = result;
    print('Found Hotels $foundHotels');
    notifyListeners();
  }
}