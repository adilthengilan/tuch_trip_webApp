import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/bookingProvider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Mobile/Home/menu.dart';
import 'package:tuch/src/view/Mobile/Home/mobile_view_body.dart';
import 'package:tuch/src/view/Mobile/profile/profile_screen.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> AppBar
      drawer: DrawerScreen(),
      appBar: AppBar(
        surfaceTintColor: backgroundColor,
        backgroundColor: backgroundColor,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: blackShadeColor,
              ));
        }),
        title: Text('Tuch Trip', style: headingblack),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: blackShadeColor),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.03, right: width * 0.03, top: height * 0.04),
              child: Column(
                children: [
                  HotelDetails(),
                  SizedBox(height: 16.0),
                  Text(
                    'Commission-free booking guarantee',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'The full amount of your stay will be charged at the time of booking. Your reservation will be confirmed right after clicking on the Checkout Now button.',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 16.0),
                  promocode(height, width),
                  SizedBox(height: 16.0),
                  Text(
                    'Payment method',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  sizedbox(height * 0.03, width),
                  PaymentMethod(),
                  SizedBox(height: 16.0),
                  CheckoutButton(),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
            FooterDetails(),
            sizedbox(height * 0.02, width),
            Padding(
              padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
              child: Container(
                height: height * 0.12,
                // height: height * 0.40,
                // width: width * 0.950,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-0.3, 1),
                        blurRadius: 2,
                        blurStyle: BlurStyle.normal,
                        spreadRadius: 0,
                        color: greyShadeDark
                        // color: darktheme
                        //     ? Color.fromARGB(255, 165, 223, 254)
                        //     : Color.fromARGB(255, 248, 248, 248),
                        ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Container(
                        height: height * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(223, 24, 188, 115)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.02, right: width * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Pay now'), Text('\$456.27')],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            sizedbox(height * 0.08, width),
            Footer(),
          ],
        ),
      ),
    );
  }

  Widget promocode(height, width) {
    return Container(
      height: height * 0.10,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(-0.3, 1),
              blurRadius: 2,
              blurStyle: BlurStyle.normal,
              spreadRadius: 0,
              color: greyShadeDark
              // color: darktheme
              //     ? Color.fromARGB(255, 165, 223, 254)
              //     : Color.fromARGB(255, 248, 248, 248),
              ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Promo code or gift certificate',
                  hintStyle: TextStyle(fontSize: 10),
                ),
              ),
            ),
            SizedBox(width: 8.0),
            InkWell(
              onTap: () {},
              child: Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }

  //  // ===================================== CONTACT DETAILS ==================================================
  // Widget contactDetails(height, width, context) {
  //   return Consumer<ContactDetailsProvider>(
  //       builder: (context, contactdetails, child) {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               'Contact Details',
  //               style: greysmallTextStyle,
  //             ),
  //             InkWell(
  //               onTap: () {
  //                 showBottomSheetcontact(context);
  //               },
  //               child: Icon(
  //                 Icons.edit,
  //                 color: blackShadeColor,
  //               ),
  //             )
  //           ],
  //         ),
  //         sizedBox(height * 0.02, width),
  //         Text(
  //           contactdetails.name,
  //           style: BlackLightTextStyle,
  //         ),
  //         sizedBox(height * 0.01, width),
  //         Text(
  //           contactdetails.email,
  //           style: smallTextStyle,
  //         ),
  //         sizedBox(height * 0.01, width),
  //         Text(
  //           contactdetails.phone,
  //           style: smallTextStyle,
  //         )
  //       ],
  //     );
  //   });
  // }
}

class HotelDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      // height: height * 0.40,
      width: width * 0.950,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              offset: Offset(-0.3, 1),
              blurRadius: 2,
              blurStyle: BlurStyle.normal,
              spreadRadius: 0,
              color: greyShadeDark
              // color: darktheme
              //     ? Color.fromARGB(255, 165, 223, 254)
              //     : Color.fromARGB(255, 248, 248, 248),
              ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: width * 0.02,
            top: height * 0.02,
            right: width * 0.03,
            bottom: height * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: height * 0.04,
                      width: width * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow,
                      ),
                      child: Center(
                        child: Text(
                          "8.9",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    sizedbox(height * 0.01, width * 0.01),
                    Text(
                      'Resort',
                      style: TextStyle(fontSize: 12),
                    ),
                    sizedbox(height * 0.01, width * 0.01),
                    Row(
                      children: List.generate(
                        5,
                        (index) => ratingStarIcon(height),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Jumeira minah A`salam - Madinathu\nJumeira',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: width * 0.500,
                  child: Text(
                    "Jubairah beach road,Jumairah madinath resort, United Arab Emirates,Dubai",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.date_range, size: 12),
                    SizedBox(width: 4.0),
                    Text(
                      'Jun 20 from 15:00 — Jun 21 until 12:00',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.cancel, size: 12),
                    SizedBox(width: 4.0),
                    Text(
                      'No free cancellation',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(width: 16.0),
                    Icon(Icons.room_service, size: 12),
                    SizedBox(width: 4.0),
                    Text(
                      'Room only',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.people, size: 12),
                    SizedBox(width: 4.0),
                    Text(
                      '2 adults',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.room, size: 12),
                    SizedBox(width: 4.0),
                    Text(
                      'Deluxe rooms',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.bed, size: 12),
                    SizedBox(width: 4.0),
                    Text(
                      'Queen bed',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.22,
                  width: width * 0.24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/luxury hotel.jpg"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Rating star
  Widget ratingStarIcon(height) {
    return Icon(
      Icons.star,
      color: orangeColor,
      size: height * 0.02,
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Colors.black,
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('TUCHTRIP', style: heading),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Contacts',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(width: 16.0),
              Text(
                'FAQ',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(width: 16.0),
              Text(
                'User Agreement',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(width: 16.0),
              Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(width: 16.0),
              Text(
                'Cookies Policy',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            'The contents of this website are subject to copyright protection. ©2024 ONLINE TRAVEL SOLUTIONS - FZCO. All rights reserved. No contents of this website may be copied, used, distributed or modified. Solartrip shall not be held liable for the content of any external websites.',
            style: TextStyle(
              fontSize: 12,
              color: greyShadeLight,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/visa.png',
              //     height: 24), // Replace with your image asset
              // SizedBox(width: 8.0),
              // Image.asset('assets/mastercard.png',
              //     height: 24), // Replace with your image asset
              // SizedBox(width: 8.0),
              // Image.asset('assets/crypto.png',
              //     height: 24), // Replace with your image asset
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BookingModel>(
      builder: (context, bookingModel, child) {
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: Offset(-0.3, 1),
                  blurRadius: 2,
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 0,
                  color: greyShadeDark
                  // color: darktheme
                  //     ? Color.fromARGB(255, 165, 223, 254)
                  //     : Color.fromARGB(255, 248, 248, 248),
                  ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.0),
              ListTile(
                leading: Radio<String>(
                  value: 'By Cash',
                  groupValue: bookingModel.paymentMethod,
                  onChanged: (value) {
                    bookingModel.updatePaymentMethod(value!);
                  },
                ),
                title: Text('By Cash'),
                trailing: Icon(Icons.payment_outlined),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'By card',
                  groupValue: bookingModel.paymentMethod,
                  onChanged: (value) {
                    bookingModel.updatePaymentMethod(value!);
                  },
                ),
                title: Text('By card'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.credit_card),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CheckoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: Center(
        child: Text(
          'crypto.com Pay',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class FooterDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Please read the hotel policies.',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            'This booking is being made in accordance with the Agreement with Solartrip. You give your consent to the processing of your personal data',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 8.0),
          Text(
            'An SSL Certificate protects the transfer of data on our website. Solartrip is fully PCI compliant, conforming to Visa and MasterCard security standards.',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 16.0),
          Container(
            // height: height * 0.40,
            // width: width * 0.950,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    offset: Offset(-0.3, 1),
                    blurRadius: 2,
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 0,
                    color: greyShadeDark
                    // color: darktheme
                    //     ? Color.fromARGB(255, 165, 223, 254)
                    //     : Color.fromARGB(255, 248, 248, 248),
                    ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Check-in',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Jun 20 2024, Thu'),
                      Text('from 15:00'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Check-out',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Jun 21 2024, Fri'),
                      Text('until 12:00'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
