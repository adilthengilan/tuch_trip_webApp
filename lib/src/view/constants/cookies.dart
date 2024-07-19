import 'package:flutter/material.dart';
import 'package:tuch/src/view/Mobile/Home/menu.dart';
import 'package:tuch/src/view/Mobile/profile/profile_screen.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';

class CookiesPolicy extends StatelessWidget {
  const CookiesPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> AppBar
      drawer: DrawerScreen(),
      appBar: AppBar(
        backgroundColor: blackShadeColor,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: backgroundColor,
              ));
        }),
        title: Text('Tuch Trip', style: heading),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
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
      body: SingleChildScrollView(child: Column(children: [ 
        
       ],),),
    );
  }
}
