import 'package:flutter/material.dart';

class RoomProvider with ChangeNotifier {
  List<Room> _rooms = [
    Room(
      title: 'Deluxe rooms,\n 538 — 591.8 m2',
      options: [
        RoomOption(
            description: "Room only",
            price: 417.0,
            cashback: 20.0,
            breakfastIncluded: false),
        RoomOption(
            description: "Breakfast",
            price: 480.0,
            cashback: 23.0,
            breakfastIncluded: true),
      ],
      image: 'assets/images/Dubai.png',
    ),
    Room(
      title: "Club rooms, 538 m²",
      options: [
        RoomOption(
            description: "Queen Bed",
            price: 577.0,
            cashback: 28.0,
            breakfastIncluded: true),
      ],
      image: 'assets/images/luxury hotel.jpg',
    ),
  ];

  List<Room> get rooms => _rooms;
}

class Room {
  final String title;
  final List<RoomOption> options;
  final String image;

  Room({required this.title, required this.options, required this.image});
}

class RoomOption {
  final String description;
  final double price;
  final double cashback;
  final bool breakfastIncluded;

  RoomOption({
    required this.description,
    required this.price,
    required this.cashback,
    required this.breakfastIncluded,
  });
}
