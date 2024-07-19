import 'package:flutter/material.dart';

class HotelProvider with ChangeNotifier {
  List<Hotel> _hotels = [
    Hotel(
      name: 'Jumeirah Al Qasr',
      location: 'Dubai',
      price: 643,
      cashback: 32,
      imageUrl: 'assets/images/uk.jpeg',
      isResort: true,
    ),
    Hotel(
      name: 'Taj Dubai',
      location: 'Dubai',
      price: 170,
      cashback: 8,
      imageUrl: 'assets/images/uk.jpeg',
      isResort: false,
    ),
  ];

  List<Hotel> get hotels => _hotels;
}
class Hotel {
  final String name;
  final String location;
  final double price;
  final double cashback;
  final String imageUrl;
  final bool isResort;

  Hotel({
    required this.name,
    required this.location,
    required this.price,
    required this.cashback,
    required this.imageUrl,
    required this.isResort,
  });
}
