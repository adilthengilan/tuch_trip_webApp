import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// models/hotel.dart
class Hotel {
  final String id;
  final String name;
  final String address;

  Hotel({required this.id, required this.name, required this.address});

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['hotel_id'].toString(),
      name: json['hotel_name'],
      address: json['address'],
    );
  }
}

// --------------------------Api ServiceProvider containing the hotel details data from the API-------------------------------

class ApiService extends ChangeNotifier {
  int pageNumber = 0;
  int imageindex = 0;
  void updateimageindex(int index) {
    imageindex = index;
    notifyListeners();
  }

  int currentPage = 1;
  final int totalPages = 10;

  void goToPage(int pageNumber) {
    currentPage = pageNumber.clamp(1, totalPages); // Clamp to valid range
    notifyListeners();
  }

  void pagenumberset(int number) {
    pageNumber = number;
    notifyListeners();
  }

  void pagenumberinc() {
    pageNumber + 1;
    notifyListeners();
  }

  void pagenumberdec() {
    pageNumber - 1;
    notifyListeners();
  }

  List<dynamic> HotelsDetails = [];
  List<dynamic> HotelImages = [];
  var _LocationID;
  var _HotelId;
  static const Map<String, String> _headers = {
    'x-rapidapi-host': 'booking-com.p.rapidapi.com',
    'x-rapidapi-key':
        '7caa571b52msh90814565c44d074p11773fjsnacbfdbbe862e', // Replace with your RapidAPI key
  };
  // -------------- Search Location Function is used to find the location id to find Hotels----------------------------
  Future<void> searchLocation(String searchedLocation, String checkin,
      String Checkout, int Adults, int PageNumber) async {
    // ------------ Extract First Word is used to take First Name from location eg:- (from  Ajman , emirates  to Ajman  )
    String extractFirstWord(String text) {
      List<String> words = text.split(', ');
      if (words.isNotEmpty) {
        return words[0];
      }
      return '';
    }

    String location = extractFirstWord(searchedLocation);
    print(searchedLocation);
    HotelsDetails.clear();
    final response = await http.get(
      Uri.parse(
          'https://booking-com.p.rapidapi.com/v1/hotels/locations?name=$location&locale=en-gb'),
      headers: _headers,
    );
    String convertDate(String dateStr) {
      // Define the input and output date formats
      DateFormat inputFormat = DateFormat('EEE dd MMM');
      DateFormat outputFormat = DateFormat('yyyy-MM-dd');

      // Parse the date
      DateTime date = inputFormat.parse(dateStr);

      // Format the date to the desired output format
      String formattedDate = outputFormat.format(date);

      // Add the year 2024 to the formatted date string
      return '2024-${formattedDate.substring(5)}';
    }

    String CheckinDate = convertDate(checkin);
    String CheckoutDate = convertDate(Checkout);
    print('${CheckinDate}${CheckoutDate}');
    if (response.statusCode == 200) {
      print('location finded');
      print('${response.statusCode}ls');
      List<dynamic> text = jsonDecode(response.body);
      //-------Dest id the destination id ---------------------------------------------------------------------------------------------
      _LocationID = text[0]['dest_id'];
      print(_LocationID);
      // ----------------------Search Hotels Function to Search Hotels-----------------------------------------------------------------

      searchHotel(_LocationID, CheckinDate, CheckoutDate, Adults, PageNumber);
      notifyListeners();
    } else {
      print(response.statusCode);

      throw Exception('Failed to load hotels');
    }
  }

  Future<void> searchHotel(String searchedLocation, String checkin,
      String Checkout, int Adults, int PageNumber) async {
    try {
      print('hotel finded');
      // print(checkin);
      final response = await http.get(
        Uri.parse(
            'https://booking-com.p.rapidapi.com/v1/hotels/search?checkout_date=$Checkout&order_by=popularity&filter_by_currency=AED&include_adjacency=true&children_number=2&categories_filter_ids=class%3A%3A2%2Cclass%3A%3A4%2Cfree_cancellation%3A%3A1&room_number=1&dest_id=$_LocationID&dest_type=city&adults_number=1&page_number=$PageNumber&checkin_date=$checkin&locale=en-gb&units=metric&children_ages=5%2C0'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> text = jsonDecode(response.body);
        HotelsDetails = text['result'];
        // print(HotelsDetails);
        notifyListeners();
        // print(HotelsDetails[0]);
      } else {
        print(response.statusCode);

        throw Exception('Failed to load hotels');
      }
    } catch (e) {
      print('========$e');
    }
  }

  void SearchHotelDetail(HotelId) async {
    try {
      print('hotel finded');
      // print(checkin);
      final response = await http.get(
        Uri.parse(
            'https://booking-com.p.rapidapi.com/v1/hotels/photos?hotel_id=$HotelId&locale=en-gb'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        List<dynamic> images = jsonDecode(response.body);
        HotelImages = images;
        // print(HotelsDetails);
        notifyListeners();
        // print(HotelsDetails[0]);
      } else {
        print(response.statusCode);

        throw Exception('Failed to load hotels');
      }
    } catch (e) {
      print('========$e');
    }
  }
}

class HotelScreen extends StatefulWidget {
  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Hotel>> futureHotels;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels'),
      ),
      body: FutureBuilder<List<Hotel>>(
        future: futureHotels,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hotels found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Hotel hotel = snapshot.data![index];
                return ListTile(
                  title: Text(hotel.name),
                  subtitle: Text(hotel.address),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class pagination extends StatefulWidget {
  const pagination({super.key});

  @override
  State<pagination> createState() => _paginationState();
}

class _paginationState extends State<pagination> {
  int currentPage = 1;
  final int totalPages = 150;

  void goToPage(int pageNumber) {
    setState(() {
      currentPage = pageNumber.clamp(1, totalPages); // Clamp to valid range
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination Demo (Page $currentPage)'),
      ),
      body: Column(
        children: [
          // Your page content area (replace with your widget)
          Center(child: Text('Content of Page $currentPage')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Previous button (disabled on first page)
              ElevatedButton(
                onPressed:
                    currentPage > 1 ? () => goToPage(currentPage - 1) : null,
                child: Icon(Icons.chevron_left),
              ),
              SizedBox(width: 10),
              // Show a limited range of page buttons around current page
              for (int i = currentPage - 2 > 0 ? currentPage - 2 : 1;
                  i <= currentPage + 2 && i <= totalPages;
                  i++)
                ElevatedButton(
                  onPressed: () => goToPage(i),
                  child: Text('Page $i'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        currentPage == i ? Colors.blue : Colors.grey,
                  ),
                ),
              SizedBox(width: 10),
              // Next button (disabled on last page)
              ElevatedButton(
                onPressed: currentPage < totalPages
                    ? () => goToPage(currentPage + 1)
                    : null,
                child: Icon(Icons.chevron_right),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShimmerListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48.0,
              height: 48.0,
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 8.0,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Container(
                    width: double.infinity,
                    height: 8.0,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Container(
                    width: 40.0,
                    height: 8.0,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
