import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Util {
  ///  Used to show Custom SnackBar
  static void showCustomSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.grey[900],
      duration: const Duration(seconds: 10),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static String getUserEmail() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.email!;
    } else {
      return "Not Available";
    }
  }
}
