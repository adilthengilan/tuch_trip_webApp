import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tuch/src/view%20model/dashboard_provider.dart';
import 'package:tuch/src/view%20model/features_provider.dart';
import 'package:tuch/src/view%20model/fetching.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Desktop/desktopview.dart';
import 'package:tuch/src/view/Desktop/detaile_page/detaile_page.dart';
import 'package:tuch/src/view/Desktop/features/search_bar.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';

class SearchPageDeskTop extends StatefulWidget {
  const SearchPageDeskTop({super.key});

  @override
  State<SearchPageDeskTop> createState() => _SearchPageDeskTopState();
}

class _SearchPageDeskTopState extends State<SearchPageDeskTop> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(height: height, width: width),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizedbox(height * 0.06, width),
            Center(
              child: SearchingBar(
                height: height,
                width: width,
              ),
            ),
            sizedbox(height * 0.06, width),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  filteringBoxWithLocationContainer(height, width),
                  sizedbox(0.0, width * 0.02),
                  // Hotels Listing in the Listview builder with detailes
                  hotelListingListviewBuilder(width, height),
                ],
              ),
            ),
            Consumer2<ApiService, FeaturesProvider>(
              builder: (context, api_service, features, child) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Previous button (disabled on first page)
                  InkWell(
                    onTap: api_service.currentPage > 1
                        ? () {
                            api_service.goToPage(api_service.currentPage - 1);
                            api_service.pagenumberdec();
                            api_service.searchLocation(
                                features.selectedLocation,
                                features.checkingDate,
                                features.checkoutDate,
                                0,
                                api_service.pageNumber);
                          }
                        : null,
                    child: Icon(Icons.chevron_left),
                  ),
                  SizedBox(width: 10),
                  // Show a limited range of page buttons around current page
                  for (int i = api_service.currentPage - 2 > 0
                          ? api_service.currentPage - 2
                          : 1;
                      i <= api_service.currentPage + 2 &&
                          i <= api_service.totalPages;
                      i++)
                    InkWell(
                      onTap: () {
                        api_service.goToPage(i);
                        api_service.pagenumberset(i);
                        api_service.searchLocation(
                            features.selectedLocation,
                            features.checkingDate,
                            features.checkoutDate,
                            0,
                            api_service.pageNumber);
                      },
                      child: Container(
                          margin: EdgeInsets.all(10),
                          height: 50,
                          width: 50,
                          child: Center(child: Text('$i'))),
                    ),
                  SizedBox(width: 10),
                  // Next button (disabled on last page)
                  InkWell(
                    onTap: api_service.currentPage < api_service.totalPages
                        ? () =>
                            api_service.goToPage(api_service.currentPage + 1)
                        : null,
                    child: Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container filteringBoxWithLocationContainer(double height, double width) {
    List FilterSelections = [
      'Stay Type',
      'Aparthotels',
      'Apartments',
      'Holiday Homes',
      'Hotels',
      'Resorts',
      'Services',
      'Restaurant',
      'Smart Check-In',
      'Internet',
      'Free WiFi',
      'Pool',
      'Parking',
      'Close to beach',
      'Pets allowed',
      'Kids facilities',
      'Breakfast',
      'Meeting Room',
      'Squash',
      'Bike tours',
      'Live music / Performance',
      '24 hours check-in desk',
      'Spa Service',
      'Shuttle-service',
      'Your Spending Plan',
      'Under \$600',
      '600 - \$1,200',
      '1 200 - \$1,800',
      '1 800 - \$2,400',
      '2 400 - \$3,000',
      'Avove \$3,000',
    ];
    return Container(
      width: width * 0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, 2),
            blurRadius: 2,
            color: Color.fromARGB(123, 237, 237, 237),
          ),
          BoxShadow(
            offset: Offset(-1, -1),
            blurRadius: 2,
            color: Color.fromARGB(255, 216, 216, 216),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              color: Colors.grey.shade300,
              //================================================================= Map Image ============================================
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/locationMapimage.png'),
              ),
            ),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: Size(width * 0.12, height * 0.028),
                  side: BorderSide(color: Colors.cyan.shade300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on_outlined),
                    sizedbox(0.0, width * 0.002),
                    Text('On Map', style: smallTextStyle),
                  ],
                ),
              ),
            ),
          ),
          sizedbox(height * 0.02, 0.0),
          Column(
            //========================================================= Check Box List =======================================================
            children: List.generate(
              FilterSelections.length,
              (index) => FilterSelections[index] == 'Stay Type' ||
                      FilterSelections[index] == 'Services' ||
                      FilterSelections[index] == 'Your Spending Plan'
                  ? Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.01,
                          top: height * 0.03,
                          bottom: height * 0.015),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: width * 0.08,
                          child: Text(
                            FilterSelections[index],
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Consumer<DashBoardProvider>(
                      builder: (context, filter, child) => CheckboxListTile(
                          activeColor: Colors.cyanAccent,
                          title: Row(
                            children: [
                              //=================================================== Categories ========================================================
                              Text(
                                FilterSelections[index],
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          value: filter.allFilters[index],
                          onChanged: (newValue) {
                            filter.updateFilter(index, newValue!);
                          },
                          controlAffinity: ListTileControlAffinity.leading),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  //==============================================================================================================================
  Column hotelListingListviewBuilder(double width, double height) {
    return Column(
      children: [
        Stack(children: [
          SizedBox(
              width: width * 0.6,
              child: Consumer<ApiService>(builder: (context, value, child) {
                print(value.HotelsDetails.length);

                if (value.HotelsDetails.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.HotelsDetails.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: height * 0.02),
                      child: InkWell(
                        onTap: () {
                          // url_1440
                          value.SearchHotelDetail(
                              value.HotelsDetails[index]['hotel_id']);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailePageDesktop(
                                HotelName: value.HotelsDetails[index]
                                    ['hotel_name'],
                                thumbnail: value.HotelsDetails[index]
                                    ['max_1440_photo_url'],
                                rate: value.HotelsDetails[index]
                                    ['min_total_price'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: height * 0.3,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, -2),
                                blurRadius: 1,
                                color: Color.fromARGB(123, 237, 237, 237),
                              ),
                              BoxShadow(
                                offset: Offset(0, -0),
                                blurRadius: 2,
                                color: Color.fromARGB(255, 216, 216, 216),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: double.infinity,
                                width: width * 0.16,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(15),
                                  ),
                                  //====================================================================== Hotel Image ========================================================
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        '${value.HotelsDetails[index]['max_1440_photo_url']}'),
                                  ),
                                ),
                              ),
                              sizedbox(0.0, width * 0.02),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: height * 0.04,
                                  left: width * 0.01,
                                  bottom: height * 0.01,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        StarRating(
                                          height: height * 0.025,
                                          rating: 4.8,
                                          starCount: 5,
                                          color: Colors.black,
                                        ),
                                        sizedbox(0.0, width * 0.01),
                                        Text(
                                          index != 1 ? 'Hotel' : 'Resort',
                                          style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    //================================================ Hotel Name ==============================================================================
                                    SizedBox(
                                      width: width * 0.2,
                                      height: height * 0.1,
                                      child: Text(
                                        '${value.HotelsDetails[index]['hotel_name']}',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    //============================================== Hotel Location ================================================================================
                                    Text(
                                        '${value.HotelsDetails[index]['city']}',
                                        style: smallTextStyle),
                                    Text(
                                        '${value.HotelsDetails[index]['distances'][0]['text']}',
                                        style: smallTextStyle),
                                    sizedbox(height * 0.02, 0.0),
                                    Container(
                                      height: height * 0.0315,
                                      width: width * 0.125,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(255, 233, 189, 1),
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: const [
                                          BoxShadow(
                                            offset: Offset(2, 4),
                                            blurRadius: 2,
                                            color: Color.fromARGB(
                                                123, 237, 237, 237),
                                          ),
                                          BoxShadow(
                                            offset: Offset(-2, -1),
                                            blurRadius: 2,
                                            color: Color.fromARGB(
                                                255, 216, 216, 216),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Smart Check-In Offered',
                                        style: GoogleFonts.poppins(
                                            color:
                                                Color.fromRGBO(36, 94, 65, 1)),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: height * 0.07,
                                    right: width * 0.02,
                                    bottom: height * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    //=================================================== Hotel Price ===========================================================================
                                    Text(
                                      'AED - ${value.HotelsDetails[index]['min_total_price']}',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text('Including Taxes and Fees',
                                        style: GoogleFonts.montserrat()),
                                    const Text('1 /Night'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  print(value.HotelsDetails.length);

                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: height * 0.02),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: height * 0.3,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, -2),
                                  blurRadius: 1,
                                  color: Color.fromARGB(123, 237, 237, 237),
                                ),
                                BoxShadow(
                                  offset: Offset(0, -0),
                                  blurRadius: 2,
                                  color: Color.fromARGB(255, 216, 216, 216),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: width * 0.16,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(15),
                                    ),
                                    //====================================================================== Hotel Image ========================================================
                                  ),
                                ),
                                sizedbox(0.0, width * 0.02),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: height * 0.04,
                                    left: width * 0.01,
                                    bottom: height * 0.01,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          StarRating(
                                            height: height * 0.025,
                                            rating: 4.8,
                                            starCount: 5,
                                            color: Colors.black,
                                          ),
                                          sizedbox(0.0, width * 0.01),
                                          Container()
                                        ],
                                      ),
                                      //================================================ Hotel Name ==============================================================================
                                      Container(
                                        width: width * 0.2,
                                        height: height * 0.1,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      //============================================== Hotel Location ================================================================================
                                      Container(
                                        width: width * 0.2,
                                        height: height * 0.1,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      Container(
                                        width: width * 0.2,
                                        height: height * 0.1,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      sizedbox(height * 0.02, 0.0),
                                      Container(
                                        height: height * 0.0315,
                                        width: width * 0.125,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 233, 189, 1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(2, 4),
                                              blurRadius: 2,
                                              color: Color.fromARGB(
                                                  123, 237, 237, 237),
                                            ),
                                            BoxShadow(
                                              offset: Offset(-2, -1),
                                              blurRadius: 2,
                                              color: Color.fromARGB(
                                                  255, 216, 216, 216),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // const Spacer(),
                                // Padding(
                                //   padding: EdgeInsets.only(
                                //       top: height * 0.07,
                                //       right: width * 0.02,
                                //       bottom: height * 0.02),
                                //   child: Column(
                                //     crossAxisAlignment: CrossAxisAlignment.end,
                                //     children: [
                                //       //=================================================== Hotel Price ===========================================================================
                                //       Container(
                                //         width: width * 0.2,
                                //         height: height * 0.05,
                                //         decoration: BoxDecoration(
                                //             color: Colors.grey,
                                //             borderRadius:
                                //                 BorderRadius.circular(20)),
                                //       ),
                                //       Container(
                                //         width: width * 0.2,
                                //         height: height * 0.05,
                                //         decoration: BoxDecoration(
                                //             color: Colors.grey,
                                //             borderRadius:
                                //                 BorderRadius.circular(20)),
                                //       ),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              })),
        ]),
        sizedbox(height * 0.1, 0.0),
      ],
    );
  }
}

//===================================================================================================================================
//===================================================================================================================================
//======================================================== Rating Star ==============================================================
//===================================================================================================================================
//===================================================================================================================================
class StarRating extends StatelessWidget {
  final double rating;
  final int starCount;
  final double height;
  final Color color;

  StarRating({
    this.rating = 0.0,
    this.starCount = 5,
    required this.height,
    required this.color,
  });

  Widget buildStar(BuildContext context, int index) {
    Widget icon;
    if (index >= rating) {
      icon = AppIcon(
          iconData: Icons.star_border,
          color: const Color.fromARGB(255, 255, 255, 255),
          height: height);
    } else if (index > rating - 1 && index < rating) {
      icon = AppIcon(
        iconData: Icons.star_half,
        color: Color.fromARGB(255, 201, 201, 201),
        height: height,
      );
    } else {
      icon = AppIcon(
        iconData: Icons.star,
        color: color,
        height: height,
      );
    }
    return InkResponse(
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        starCount,
        (index) => buildStar(context, index),
      ),
    );
  }
}
