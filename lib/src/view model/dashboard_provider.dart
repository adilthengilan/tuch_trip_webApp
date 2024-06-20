import 'dart:async';
import 'package:flutter/material.dart';

class DashBoardProvider extends ChangeNotifier {
  int selectedCategoryIndex = 0;
  String locationText = '';
  int bottombarindex = 0;
  bool isTimeStarted = false;

  void setBottomBarindex(index) {
    bottombarindex = index;
    notifyListeners();
  }

// assigning category selected button index to selectecategorindex variable
  void setCategoryButtonColor(index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  void setLocationAddress(LocationDataAddress) {
    locationText = LocationDataAddress;
    notifyListeners();
  }

  int seconds = 22 * 60 * 60; // 22 hours in seconds
  Timer? timer;
// Booking CountDown Timer
  void startTimer(int Hour, int minute) {
    DateTime now = DateTime.now();
    if (now.hour == Hour && now.minute == minute) {
      if (timer != null) {
        timer!.cancel();
        isTimeStarted = true;
        notifyListeners();
        print("first ${isTimeStarted}");
        print("Hours${now.hour} minutes ${now.minute}");
      }

      seconds = 22 * 60 * 60; // Reset to 22 hours is the Hotel Chekout Time
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (seconds > 0) {
          seconds--;
        } else {
          timer.cancel();
          isTimeStarted = false;
          notifyListeners();
          print("last ${isTimeStarted}");
        }
      });
    }
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  //========================================================================================================================
  //========================================================================================================================
  //======================================== Search Page Porviders =========================================================
  //========================================================================================================================
  //========================================================================================================================
  //========================================================================================================================

  bool stayType = false;
  bool aparthotel = false;
  bool apartment = false;
  bool holidayHome = false;
  bool hotel = false;
  bool resort = false;
  bool service = false;
  bool restourant = false;
  bool smartChekin = false;
  bool internet = false;
  bool freeWifi = false;
  bool pool = false;
  bool parking = false;
  bool closetoBeach = false;
  bool petsAllowed = false;
  bool kidsFecilities = false;
  bool breakfast = false;
  bool meetingRoom = false;
  bool squash = false;
  bool biketours = false;
  bool liveMusicPerformance = false;
  bool t24CheckInDesk = false;
  bool shuttleService = false;
  bool spaServiceAvailable = false;
  bool yourspedingplan = false;
  bool under600 = false;
  bool between600to1200 = false;
  bool between1200to1800 = false;
  bool between1800to2400 = false;
  bool between2400to3000 = false;
  bool above3000 = false;

  List<bool> get allFilters => [
        stayType,
        aparthotel,
        apartment,
        holidayHome,
        hotel,
        resort,
        service,
        restourant,
        smartChekin,
        internet,
        freeWifi,
        pool,
        parking,
        closetoBeach,
        petsAllowed,
        kidsFecilities,
        breakfast,
        meetingRoom,
        squash,
        biketours,
        liveMusicPerformance,
        t24CheckInDesk,
        shuttleService,
        spaServiceAvailable,
        yourspedingplan,
        under600,
        between600to1200,
        between1200to1800,
        between1800to2400,
        between2400to3000,
        above3000,
      ];

  // Method to update a filter value
  void updateFilter(int index, bool newValue) {
    switch (index) {
      case 0:
        stayType = newValue;
        break;
      case 1:
        aparthotel = newValue;
        break;
      case 2:
        apartment = newValue;
        break;
      case 3:
        holidayHome = newValue;
        break;
      case 4:
        hotel = newValue;
        break;
      case 5:
        resort = newValue;
        break;
      case 6:
        service = newValue;
        break;
      case 7:
        restourant = newValue;
        break;
      case 8:
        smartChekin = newValue;
        break;
      case 9:
        internet = newValue;
        break;
      case 10:
        freeWifi = newValue;
        break;
      case 11:
        pool = newValue;
        break;
      case 12:
        parking = newValue;
        break;
      case 13:
        closetoBeach = newValue;
        break;
      case 14:
        petsAllowed = newValue;
        break;
      case 15:
        kidsFecilities = newValue;
        break;
      case 16:
        breakfast = newValue;
        break;
      case 17:
        meetingRoom = newValue;
        break;
      case 18:
        squash = newValue;
        break;
      case 19:
        biketours = newValue;
        break;
      case 20:
        liveMusicPerformance = newValue;
        break;
      case 21:
        t24CheckInDesk = newValue;
        break;
      case 22:
        shuttleService = newValue;
        break;
      case 23:
        spaServiceAvailable = newValue;
        break;
      case 24:
        yourspedingplan = newValue;
        break;
      case 25:
        under600 = newValue;
        break;
      case 26:
        between600to1200 = newValue;
        break;
      case 27:
        between1200to1800 = newValue;
        break;
      case 28:
        between1800to2400 = newValue;
        break;
      case 29:
        between2400to3000 = newValue;
        break;
      case 30:
        above3000 = newValue;
        break;
    }
    notifyListeners(); // Notify listeners to update the UI
  }
}
