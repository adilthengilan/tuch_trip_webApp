import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/features_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Common%20widget/search_bar.dart';
import 'package:tuch/utils/app_colors.dart';

class LocationSearchScreen extends StatefulWidget {
  @override
  LocationSearchScreenState createState() => LocationSearchScreenState();
}

class LocationSearchScreenState extends State<LocationSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          sizedbox(height * 0.056, width),
          Consumer<FeaturesProvider>(
            builder: (context, location, child) => AppSearchBar(
              controller: _searchController,
              onChange: (o) => location.searchLocations(_searchController.text),
              suffixIcon: IconButton(
                padding: EdgeInsets.only(right: width * 0.03),
                onPressed: () {
                  _searchController.clear();
                },
                icon: _searchController.text == ''
                    ? Icon(Icons.search)
                    : Icon(Icons.clear),
              ),
              prefixIcon: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios),
              ),
              hintText: 'Search Your Location',
              width: width,
              height: height,
            ),
          ),
          sizedbox(height * 0.02, width),
          Consumer<FeaturesProvider>(
            builder: (context, locationProvider, child) => Expanded(
              child: locationProvider.searchResults.isEmpty
                  ? SizedBox()
                  : ListView.builder(
                      itemCount: locationProvider.searchResults.length,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.00),
                      itemBuilder: (context, index) {
                        final location = locationProvider.searchResults[index];
                        return TextButton(
                          onPressed: () {
                            locationProvider
                                .setLocationText(location['display_name']);
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            leading: Icon(Icons.location_on_outlined),
                            title: Text(location['display_name']),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}