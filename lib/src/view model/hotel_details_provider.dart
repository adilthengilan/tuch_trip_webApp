import 'package:flutter/material.dart';

class HotelDetailProvider with ChangeNotifier {
  final HotelDetail _hotelDetail = HotelDetail(
    name: "Jumeirah Mina A'Salam - Madinat Jumeirah",
    location: "Dubai, United Arab Emirates",
    rating: 8.9,
    imageUrl: 'assets/images/uk.jpeg', // Replace with your image path
    description:
        "Resort Jumeirah Mina A'Salam - Madinat Jumeirah is located in Dubai, United Arab Emirates at Dubai, Jumeirah Beach Road, Madinat Jumeirah Resort 18.2 km from the city center. Check in from 15:00 until 00:00, check out until 12:00.",
    amenities: ["Free Wi-Fi", "Air Conditioning"],
    startingPrice: 417,
    services: [
      "24 Hour Front Desk",
      "Onsite ATM",
      "Business Centre",
      "Car Rental",
      "Daily Maid Service",
      "Dry Cleaning",
      "Fax / Photocopying",
      "Ironing Service",
      "Laundry",
      "Lockers",
      "Baggage Storage",
      "Events / Banquet Hall",
      "Private Check-in / Check-out",
      "Room Service",
      "Shoeshine",
      "Souvenirs / Gift Shop",
      "Tour Desk",
      "VIP Room Service",
      "Fitness/Spa Locker Rooms",
    ],
    General: [
      "Air Conditioning",
      "Currency Exchange",
    ],
    foodanddrinks: [
      "Pool Bar",
      'Breakfast in the room',
      "Breakfast Options",
    ],
    activities: [
      "Aqua Park",
      "Entertainment Team",
    ],
    nearby: [
      'Souk madinath jumairah',
      'Soak madinath jumaira',
    ],
  );
  final Map<String, IconData> amenityIcons = {
  'Free Wi-Fi': Icons.wifi,
  'Air Conditioning': Icons.ac_unit,
  '24 Hour Front Desk': Icons.access_time,
  'Onsite ATM': Icons.atm,
  'Business Centre': Icons.business,
  'Car Rental': Icons.directions_car,
  'Daily Maid Service': Icons.cleaning_services,
  'Dry Cleaning': Icons.local_laundry_service,
  'Fax / Photocopying': Icons.print,
  'Ironing Service': Icons.iron,
  'Laundry': Icons.local_laundry_service,
  'Lockers': Icons.lock,
  'Baggage Storage': Icons.business_center,
  'Events / Banquet Hall': Icons.event,
  'Private Check-in / Check-out': Icons.login,
  'Room Service': Icons.room_service,
  'Shoeshine': Icons.clean_hands,
  'Souvenirs / Gift Shop': Icons.shop,
  'Tour Desk': Icons.tour,
  'VIP Room Service': Icons.room_service_outlined,
  'Fitness/Spa Locker Rooms': Icons.fitness_center,
  'Pool Bar': Icons.pool,
  'Breakfast in the room': Icons.breakfast_dining,
  'Breakfast Options': Icons.restaurant,
  'Aqua Park': Icons.water,
  'Entertainment Team': Icons.music_note,
  'Souk madinath jumairah': Icons.shopping_bag,
  'Soak madinath jumaira': Icons.shopping_bag,
  // Add more amenities and their respective icons here
};


  HotelDetail get hotelDetail => _hotelDetail;
}

class HotelDetail {
  final String name;
  final String location;
  final double rating;
  final String imageUrl;
  final String description;
  final List<String> amenities;
  final List<String> services;
  final List<String> General;
  final List<String> foodanddrinks;
  final List<String> activities;
  final List<String> nearby;

  final double startingPrice;

  HotelDetail(
      {required this.name,
      required this.location,
      required this.rating,
      required this.imageUrl,
      required this.description,
      required this.amenities,
      required this.startingPrice,
      required this.services,
      required this.General,
      required this.foodanddrinks,
      required this.activities,
      required this.nearby});
}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Review Provider>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// review_provider.dart


class ReviewProvider with ChangeNotifier {
  List<Review> _reviews = [
    Review(
      rating: 10.0,
      title: 'Exceptional',
      body:
          'This property was exceptional in every way. Every small detail has been thought out and I would say that the staff are this hotel’s best asset. Without exception they were amazing. Nothing was too much trouble. The men looking after us at the beach were incredible, I would like to single out Razzak, he was attentive, courteous and very friendly, all are a credit to this hotel.',
      userName: 'Carole',
      userType: 'Couple',
      date: 'June 2024',
    ),
    Review(
      rating: 9.0,
      title: 'Wonderful',
      body:
          'Great staff, rooms, location and beach. Jumeirah group never disappoints. The attention to details is amazing in every corner of the facilities. The restaurants are good but not great. Pier Chic standards are lower than 10 years ago.',
      userName: 'Thomas',
      userType: 'Couple',
      date: 'June 2024',
    ),
  ];

  List<Review> get reviews => _reviews;
}
// review.dart

class Review {
  final double rating;
  final String title;
  final String body;
  final String userName;
  final String userType;
  final String date;

  Review({
    required this.rating,
    required this.title,
    required this.body,
    required this.userName,
    required this.userType,
    required this.date,
  });
}
