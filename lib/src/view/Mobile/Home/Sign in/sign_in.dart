import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tuch/src/view%20model/sign_in_provider.dart';
import 'package:tuch/src/view/Common%20widget/app_icon.dart';
import 'package:tuch/src/view/Common%20widget/app_text_button.dart';
import 'package:tuch/src/view/Desktop/booking_page/booking_page.dart';
import 'package:tuch/src/view/Desktop/details/detail_page.dart';
import 'package:tuch/utils/app_colors.dart';
import 'package:tuch/utils/textstyles.dart';

class SignInBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
  final TextEditingController emailController = TextEditingController();
    AuthModel authModel = Provider.of<AuthModel>(context);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
        child: Container(
          width: width,
          padding: EdgeInsets.only(
            bottom: height * 0.10,
            top: height * 0.05,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Enter your email address\n to login or sign up",
                // authModel.isSignIn ? 'Welcome!' : 'Sign In',
                style: mediumboldTextStyle, textAlign: TextAlign.center,
              ),
              sizedbox(height * 0.03, width),
              if (!authModel.isSignIn) ...[
                SizedBox(
                  width: width * 0.890,
                  child: CustomTextField(
                    labelText: 'Email',
                    controller: emailController,
                  ),
                ),

                sizedbox(height * 0.02, width),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return OtpVerification();
                        });
                    // authModel.signIn();
                    // Navigator.pop(context);
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.890,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 105, 227, 255),
                          Color.fromARGB(255, 255, 176, 248),
                          Color.fromARGB(255, 255, 248, 184)
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text("Continue", style: smallTextStyle),
                    ),
                  ),
                ),
                sizedbox(height * 0.02, width),
                SizedBox(
                  width: width * 0.900,
                  child: Text(
                    'By clicking "Continue",you accept the user agreement and give your consent to the processing of personal data',
                    style: greytextstyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                sizedbox(height * 0.02, width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: width * 0.300, child: Divider()),
                    Text(
                      " or ",
                      style: smallTextStyle,
                    ),
                    SizedBox(width: width * 0.300, child: Divider()),
                  ],
                ),
                sizedbox(height * 0.03, width),
                Container(
                  height: height * 0.07,
                  width: width * 0.850,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(07),
                      border: Border.all(color: greyShadeLight)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/images/Google.png"),
                        height: height * 0.04,
                        width: width * 0.04,
                      ),
                      sizedbox(height * 0.01, width * 0.01),
                      Text(
                        "Continue with google",
                        style: smallTextStyle,
                      )
                    ],
                  ),
                ),
                sizedbox(height * 0.02, width),
                Container(
                  height: height * 0.07,
                  width: width * 0.850,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(07),
                      border: Border.all(color: greyShadeLight)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/images/appleStore.png"),
                        height: height * 0.04,
                        width: width * 0.04,
                      ),
                      sizedbox(height * 0.01, width * 0.01),
                      Text(
                        "Continue with apple",
                        style: smallTextStyle,
                      )
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    AuthModel authModel = Provider.of<AuthModel>(context);
    String enteredOTP = ""; // OTP entered by the user

    return AlertDialog(
      backgroundColor: backgroundColor,
      title: Center(
        child: Column(
          children: [
            Text(
              "Verification",
              style: mediumboldTextStyle,
            ),
            sizedbox(height * 0.02, width),
            Text(
              "Enter the verification code we \njust to your email",
              style: smallTextStyle,
              textAlign: TextAlign.center,
            ),
            sizedbox(height * 0.03, width),
          ],
        ),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(6, (index) {
          return _buildOTPBox(context, index);
        }),
      ),
      actions: [
        sizedbox(height * 0.02, width),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "If you don't receive code yet",
                  style: smallTextStyle,
                ),
                Text(
                  " Resend it",
                  style: smallboldTextStyle,
                )
              ],
            ),
            sizedbox(height * 0.03, width),
            InkWell(
              onTap: () {
                bool isOTPVerified = authModel.verifyOTP(enteredOTP);
                if (isOTPVerified) {
                  Navigator.pop(context); // Close OTP dialog
                  authModel.signIn(); // Sign in after OTP verification
                  Navigator.pop(context); // Close bottom sheet
                } else {
                  // Handle incorrect OTP scenario
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Incorrect OTP"),
                        content: Text("Please enter correct OTP."),
                        actions: <Widget>[
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Container(
                height: height * 0.07,
                width: width * 0.890,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 105, 227, 255),
                      Color.fromARGB(255, 255, 176, 248),
                      Color.fromARGB(255, 255, 248, 184)
                    ],
                  ),
                ),
                child: Center(
                  child: Text("Verify and proceed", style: smallTextStyle),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildOTPBox(BuildContext context, int index) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String enteredOTP = ""; // OTP entered by the user

    return Container(
      width: width * 0.10,
      height: height * 0.08,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: greyShadeMedium)),
      child: TextField(
        controller: TextEditingController(),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          hintText: "0",
          hintStyle: GoogleFonts.montserrat(
              color: greyShadeMedium,
              fontWeight: FontWeight.w400,
              fontSize: 18),
          counterText: '',
          border: InputBorder.none,
        ),
        onChanged: (value) {
          enteredOTP = value;
          if (value.length == 1 && index < 3) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
