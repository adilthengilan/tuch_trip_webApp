import 'package:flutter/foundation.dart';

class BookingModel with ChangeNotifier {
  String hotelName = 'Jumeirah Mina A\'Salam - Madinat Jumeirah';
  String hotelLocation = 'Jumeirah Beach Road, Madinat Jumeirah Resort, United Arab Emirates, Dubai';
  String roomType = 'Deluxe rooms';
  String bedType = 'Queen bed';
  bool breakfastIncluded = true;
  bool freeCancellation = false;
  String checkInDate = 'Jun 20 2024, Thu';
  String checkOutDate = 'Jun 21 2024, Fri';
  String checkInTime = 'from 15:00';
  String checkOutTime = 'until 12:00';
  String paymentMethod = 'crypto.com Pay';

  void updatePaymentMethod(String newMethod) {
    paymentMethod = newMethod;
    notifyListeners();
  }
}
