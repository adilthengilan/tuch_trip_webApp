// import 'dart:io';
// import 'package:flutter/material.dart';

// class ProfileProvider extends ChangeNotifier {
//     bool _isLoggedIn = false;
//   File? image;

//     bool get isLoggedIn => _isLoggedIn;

//   // This is the image picker
//   final _picker = ImagePicker();

// void login() {
//     _isLoggedIn = true;
//     notifyListeners();
//   }

//   // Implementing the image picker
//   Future<void> openImagePicker() async {
//     final XFile? pickedImage =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       image = File(pickedImage.path);
//     }
//   }
// }
