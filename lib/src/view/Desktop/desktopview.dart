import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:tuch/src/view/Desktop/home/home.dart';
import 'package:iconly/iconly.dart';
import 'package:tuch/src/view/Desktop/home/home.dart';

TextEditingController locationController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();



class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePageDeskTop();
  }
}

//=========================================================================================================================================
//======================================================= Costum App Bar =================================================================
//=========================================================================================================================================
//=========================================================================================================================================
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
    return const HomePageDeskTop();
  }
}

//=========================================================================================================================================
//======================================================= Costum App Bar =================================================================
//=========================================================================================================================================
//=========================================================================================================================================
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final double width;

  const CustomAppBar({super.key, required this.height, required this.width});

  const CustomAppBar({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Text(
        'Tuchtrip',
        style: GoogleFonts.montserrat(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.w800,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(IconlyLight.chat),
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Text(
        'Tuchtrip',
        style: GoogleFonts.montserrat(
          fontSize: 24,
          color: Colors.black,
          fontWeight: FontWeight.w800,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(IconlyLight.chat),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            IconlyLight.profile,
            size: height * 0.035,
            color: Colors.black,
          ),
        ),
        SizedBox(width: width * 0.01),
      ],
        IconButton(
          onPressed: () {},
          icon: Icon(
            IconlyLight.profile,
            size: height * 0.035,
            color: Colors.black,
          ),
        ),
        SizedBox(width: width * 0.01),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}