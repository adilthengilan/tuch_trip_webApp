import 'package:flutter/material.dart';

class AuthModel with ChangeNotifier {
  bool _isSignIn = false;

  bool get isSignIn => _isSignIn;

  // Add fields for OTP handling
  bool _isOTPVerified = false;
  String _generatedOTP = "";

  bool get isOTPVerified => _isOTPVerified;

  // Generate OTP
  void generateOTP() {
    // Generate your OTP here (for example, using a random number generator)
    _generatedOTP = "123456"; // Replace with your actual OTP generation logic
  }

  // Verify OTP
  bool verifyOTP(String otp) {
    if (otp == _generatedOTP) {
      _isOTPVerified = true;
      return true;
    } else {
      _isOTPVerified = false;
      return false;
    }
  }

  void signIn() {
    _isSignIn = true;
    notifyListeners();
  }

  void signOut() {
    _isSignIn = false;
    _isOTPVerified = false; // Clear OTP verification status on sign out
    notifyListeners();
  }
}
