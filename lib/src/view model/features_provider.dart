import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:tuch/src/view%20model/location_service.dart';

class FeaturesProvider extends ChangeNotifier {
  bool isLocationSearchSheetOn = false;
  bool isCalendarPickerSheetOn = false;
  bool isRoomsCounterSheetOn = false;

  void disposeAllSheets() {
    isLocationSearchSheetOn = false;
    isCalendarPickerSheetOn = false;
    isRoomsCounterSheetOn = false;
    notifyListeners();
  }

  void getLocationSearchSheet() {
    isLocationSearchSheetOn = true;
    isCalendarPickerSheetOn = false;
    isRoomsCounterSheetOn = false;
    notifyListeners();
  }

  void getDatePickerSheet() {
    isCalendarPickerSheetOn = true;
    isRoomsCounterSheetOn = false;
    isLocationSearchSheetOn = false;
    notifyListeners();
  }

  void getRoomsGuestCounterSheet() {
    isRoomsCounterSheetOn = true;
    isCalendarPickerSheetOn = false;
    isLocationSearchSheetOn = false;
    notifyListeners();
  }

  ///============================================================================================================================================
  ///============================================================================================================================================
  ///===================================================  Calendar Date Picker ==================================================================
  ///============================================================================================================================================
  ///============================================================================================================================================
  List<DateTime?> rangeDatePickerValueWithDefaultValue = [null, null];
  List<DateTime?> selectedDates = [null, null];
  String checkingDate = '';
  String checkoutDate = '';
  int nights = 1;

  void setSelectDates(dates) {
    rangeDatePickerValueWithDefaultValue = dates;
    if (dates.length >= 2 && dates[0] != null && dates[1] != null) {
      selectedDates = dates;

      final checkingDayDate = DateFormat.d().format(selectedDates[0]!);
      final checkoutDayDate = DateFormat.d().format(selectedDates[1]!);
      final checkingMonth = DateFormat.MMM().format(selectedDates[0]!);
      final checkoutMonth = DateFormat.MMM().format(selectedDates[1]!);
      final checkingDayName = DateFormat.E().format(selectedDates[0]!);
      final checkoutDayName = DateFormat.E().format(selectedDates[1]!);

      checkingDate = '$checkingDayName $checkingDayDate $checkingMonth';
      checkoutDate = '$checkoutDayName $checkoutDayDate $checkoutMonth';

      notifyListeners();
    } else {
      return;
    }
  }

  void gethNightCount() {
    DateTime date1 = DateFormat('d, MMMM, E').parse(checkingDate);
    DateTime date2 = DateFormat('d, MMMM, E').parse(checkoutDate);

    // // Calculate the difference
    Duration difference = date2.difference(date1);

    // // Extract the difference in days
    nights = difference.inDays;
    print('Night : $nights');
    notifyListeners();
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////// Location searching Provider ////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  final GeocodingService _geocodingService = GeocodingService();
  TextEditingController locationController = TextEditingController();
  List<dynamic> searchResults = [];
  List<String> recentLocationHistory = [];
  String selectedLocation = '';

// on changed function in the search bar, this function will passing user input to Api service and list all the matching in the listview builder
  void searchLocations(value) async {
    if (value != null) {
      var results = await _geocodingService.searchLocations(value);
      searchResults = results;
      notifyListeners();
    }
  }

  void setLocationText(locationName) {
    if (locationName != '') {
      print('locationName ${locationName}');
      selectedLocation = locationName;
      locationController.clear();
      notifyListeners();
    } else {
      print('Location Has Error Occured Please Try Agai');
      selectedLocation = 'Location Has Error Occured Please Try Again';
      notifyListeners();
    }
  }

  //==================================== How Many Guests are Booking and they need How many Roooms ====================================================
  //===================================================================================================================================================
  //================================================= Rooms Guest and childrens count =================================================================
  //===================================================================================================================================================
  //===================================================================================================================================================
  int rooms = 1;
  int adults = 1;
  int children = 0;
  List<int> childrenAges = [];

  void setRoomCount(value) {
    rooms = value;
    notifyListeners();
  }

  void setAdultsCount(value) {
    adults = value;
    notifyListeners();
  }

  void setChildrenCount(value) {
    children = value;
    childrenAges = List.filled(value, 0);
    notifyListeners();
  }

  void setChildrenAges(newvalue, i) {
    childrenAges[i] = newvalue ?? 0;
    notifyListeners();
  }

  void getCurrentPosition() {}
}
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:tuch/src/view%20model/location_service.dart';

class FeaturesProvider extends ChangeNotifier {
  bool isLocationSearchSheetOn = false;
  bool isCalendarPickerSheetOn = false;
  bool isRoomsCounterSheetOn = false;

  void disposeAllSheets() {
    isLocationSearchSheetOn = false;
    isCalendarPickerSheetOn = false;
    isRoomsCounterSheetOn = false;
    notifyListeners();
  }

  void getLocationSearchSheet() {
    isLocationSearchSheetOn = true;
    isCalendarPickerSheetOn = false;
    isRoomsCounterSheetOn = false;
    notifyListeners();
  }

  void getDatePickerSheet() {
    isCalendarPickerSheetOn = true;
    isRoomsCounterSheetOn = false;
    isLocationSearchSheetOn = false;
    notifyListeners();
  }

  void getRoomsGuestCounterSheet() {
    isRoomsCounterSheetOn = true;
    isCalendarPickerSheetOn = false;
    isLocationSearchSheetOn = false;
    notifyListeners();
  }

  ///============================================================================================================================================
  ///============================================================================================================================================
  ///===================================================  Calendar Date Picker ==================================================================
  ///============================================================================================================================================
  ///============================================================================================================================================
  List<DateTime?> rangeDatePickerValueWithDefaultValue = [null, null];
  List<DateTime?> selectedDates = [null, null];
  String checkingDate = '';
  String checkoutDate = '';
  int nights = 1;

  void setSelectDates(dates) {
    rangeDatePickerValueWithDefaultValue = dates;
    if (dates.length >= 2 && dates[0] != null && dates[1] != null) {
      selectedDates = dates;

      final checkingDayDate = DateFormat.d().format(selectedDates[0]!);
      final checkoutDayDate = DateFormat.d().format(selectedDates[1]!);
      final checkingMonth = DateFormat.MMM().format(selectedDates[0]!);
      final checkoutMonth = DateFormat.MMM().format(selectedDates[1]!);
      final checkingDayName = DateFormat.E().format(selectedDates[0]!);
      final checkoutDayName = DateFormat.E().format(selectedDates[1]!);

      checkingDate = '$checkingDayName $checkingDayDate $checkingMonth';
      checkoutDate = '$checkoutDayName $checkoutDayDate $checkoutMonth';

      notifyListeners();
    } else {
      return;
    }
  }

  void gethNightCount() {
    DateTime date1 = DateFormat('d, MMMM, E').parse(checkingDate);
    DateTime date2 = DateFormat('d, MMMM, E').parse(checkoutDate);

    // // Calculate the difference
    Duration difference = date2.difference(date1);

    // // Extract the difference in days
    nights = difference.inDays;
    print('Night : $nights');
    notifyListeners();
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////// Location searching Provider ////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  final GeocodingService _geocodingService = GeocodingService();
  TextEditingController locationController = TextEditingController();
  List<dynamic> searchResults = [];
  List<String> recentLocationHistory = [];
  String selectedLocation = '';

// on changed function in the search bar, this function will passing user input to Api service and list all the matching in the listview builder
  void searchLocations(value) async {
    if (value != null) {
      var results = await _geocodingService.searchLocations(value);
      searchResults = results;
      notifyListeners();
    }
  }

  void setLocationText(locationName) {
    if (locationName != '') {
      print('locationName ${locationName}');
      selectedLocation = locationName;
      locationController.clear();
      notifyListeners();
    } else {
      print('Location Has Error Occured Please Try Agai');
      selectedLocation = 'Location Has Error Occured Please Try Again';
      notifyListeners();
    }
  }

  //==================================== How Many Guests are Booking and they need How many Roooms ====================================================
  //===================================================================================================================================================
  //================================================= Rooms Guest and childrens count =================================================================
  //===================================================================================================================================================
  //===================================================================================================================================================
  int rooms = 1;
  int adults = 1;
  int children = 0;
  List<int> childrenAges = [];

  void setRoomCount(value) {
    rooms = value;
    notifyListeners();
  }

  void setAdultsCount(value) {
    adults = value;
    notifyListeners();
  }

  void setChildrenCount(value) {
    children = value;
    childrenAges = List.filled(value, 0);
    notifyListeners();
  }

  void setChildrenAges(newvalue, i) {
    childrenAges[i] = newvalue ?? 0;
    notifyListeners();
  }
}
