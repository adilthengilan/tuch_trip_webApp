import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/dashboard_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Desktop/detaile_page/detaile_page.dart';
import 'package:tuch/src/view/Desktop/home/home.dart';
import 'package:tuch/utils/textstyles.dart';

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
  final double height;
  final double width;
  final bool darkMode;

  const CustomAppBar(
      {super.key,
      required this.height,
      required this.width,
      required this.darkMode});

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
          color: darkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.w800,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(IconlyLight.chat,
              color: darkMode ? Colors.white : Colors.black),
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => buildPopupDialog(context),
            );
          },
          icon: Icon(
            IconlyLight.profile,
            size: height * 0.035,
            color: darkMode ? Colors.white : Colors.black,
          ),
        ),
        SizedBox(width: width * 0.01),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget buildPopupDialog(BuildContext context) {
    final person = Provider.of<DashBoardProvider>(context, listen: false);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        width: width * 0.25,
        height: height * 0.63,
        padding: EdgeInsets.all(20),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: person.loginPaeController,
          allowImplicitScrolling: true,
          children: [
            //=============================================== Login Page ===========================================================
            const LoginPage(),
            //=============================================== Varification page ====================================================
            OtpVarificationPage(),
            VarificationSuccessFully(context),
            emailCheckBox(context, person),
          ],
        ),
      ),
    );
  }

  Column emailCheckBox(BuildContext context, DashBoardProvider person) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, size: height * 0.02),
            ),
          ),
        ),
        sizedbox(height * 0.02, 0.0),
        Center(
          child: SizedBox(
            width: width * 0.13,
            child: Text(
                'Excellent! Click the magic link in the email we sent you and then return here',
                style: mediumtextstylelight,
                textAlign: TextAlign.center),
          ),
        ),
        sizedbox(height * 0.02, 0.0),
        Center(child: Text(person.emailController.text, style: smallTextStyle)),
        sizedbox(height * 0.02, 0.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.01),
          child: GradiantButton(
              height: height * 0.055,
              width: width,
              onpressed: () {
                person.launchGmail();
              },
              text: 'Check Inbox'),
        )
      ],
    );
  }

  Column VarificationSuccessFully(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, size: height * 0.02),
            ),
          ),
        ),
        sizedbox(height * 0.03, 0.0),
        SizedBox(
          width: width * 0.18,
          child: Text(
              'Your verification is successfully completed',
              style: mediumtextstylelight,
              textAlign: TextAlign.center),
        ),
        sizedbox(height * 0.02, 0.0),
        Container(
          height: height * 0.3,
          width: width * 0.2,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/celebration_image.png'))),
        )
      ],
    );
  }
}

class OtpVarificationPage extends StatelessWidget {
  const OtpVarificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<DashBoardProvider>(context, listen: false);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        sizedbox(height * 0.02, width),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedbox(0.0, width * 0.02),
            SizedBox(
              width: width * 0.18,
              child: Text(
                  'Please enter the OTP sent to your phone number 944608976 to proceed, confirming it is correct.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ),
            const Spacer(),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, size: height * 0.02),
              ),
            ),
          ],
        ),
        sizedbox(height * 0.06, 0.0),
        OTPTextField(
            length: 6,
            onCompleted: (value) {
              person.goToPage(1);
            }),
        sizedbox(height * 0.05, 0.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.01),
          child: GradiantButton(
            height: height * 0.055,
            width: width,
            onpressed: () {
              person.goToPage(2);
            },
            text: 'Continue',
          ),
        ),
        sizedbox(height * 0.06, 0.0),
        InkWell(
          onTap: () {},
          child: Text(
            'Resend OTP',
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final person = Provider.of<DashBoardProvider>(context, listen: false);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        sizedbox(height * 0.02, 0.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedbox(0.0, width * 0.015),
            SizedBox(
              width: width * 0.18,
              child: Text(
                  'Enter your email or phone number to log in or sign up.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
            ),
            const Spacer(),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, size: height * 0.02),
              ),
            ),
          ],
        ),
        sizedbox(height * 0.04, 0.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.01),
          child: Consumer<DashBoardProvider>(
            builder: (context, person, child) => TextField(
              controller: person.isMobbileNumber
                  ? person.mobileNumberController
                  : person.emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText:
                    person.isMobbileNumber ? 'Mobile Number' : 'Email address',
              ),
            ),
          ),
        ),
        sizedbox(height * 0.03, 0.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.01),
          child: GradiantButton(
            height: height * 0.055,
            width: width,
            onpressed: () {
              person.isMobbileNumber ? person.goToPage(1) : person.goToPage(3);
            },
            text: 'Continue',
          ),
        ),
        sizedbox(height * 0.02, 0.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.01),
          child: Text(
            'By clicking “Continue”, you accept the user agreement and give your consent to the processing of personal data',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        sizedbox(height * 0.02, 0.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(color: Colors.grey.shade300),
            Text('or', style: smallTextStyle),
            Divider(color: Colors.grey.shade300),
          ],
        ),
        sizedbox(height * 0.02, 0.0),
        for (int i = 0; i < 2; i++)
          Padding(
            padding: EdgeInsets.only(
                bottom: i == 0 ? height * 0.02 : 0,
                left: width * 0.01,
                right: width * 0.01),
            child: InkWell(
              onTap: () {
                person.setSelectedSignInOption();
              },
              child: Container(
                height: height * 0.06,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: width * 0.015),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10)),
                child: Consumer<DashBoardProvider>(
                  builder: (context, person, child) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      i == 1
                          ? Image.asset('assets/images/Google_image_icon.png',
                              height: 20)
                          : Icon(
                              person.isMobbileNumber
                                  ? Icons.email_outlined
                                  : Icons.phone_iphone_outlined,
                              color: person.isMobbileNumber
                                  ? Colors.blueAccent
                                  : Colors.purpleAccent),
                      sizedbox(0.0, width * 0.006),
                      Text(
                        i == 0
                            ? person.isMobbileNumber
                                ? 'Sign in with Email'
                                : 'Sign in with phone number'
                            : 'Continue with Google',
                        style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class OTPTextField extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onCompleted;

  OTPTextField({required this.length, this.onCompleted});

  @override
  _OTPTextFieldState createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
    _controllers =
        List.generate(widget.length, (index) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.length,
        (index) => Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 226, 242, 255),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey)),
          width: 40,
          height: 40,
          child: Center(
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              onChanged: (value) {
                if (value.length == 1 && index < widget.length - 1) {
                  _focusNodes[index].unfocus();
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                } else if (value.isEmpty && index > 0) {
                  _focusNodes[index].unfocus();
                  FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                }

                // Combine all OTP digits and pass it to the parent widget
                String otp =
                    _controllers.map((controller) => controller.text).join();
                if (otp.length == widget.length) {
                  widget.onCompleted?.call(otp);
                }
              },
              decoration: InputDecoration(
                  counterText: '',
                  border: UnderlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
        ),
      ),
    );
  }
}
