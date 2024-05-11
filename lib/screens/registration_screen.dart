import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utilities/util.dart';
import '/screens/components/round_button.dart';
import '/screens/components/round_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  // For safe routing to destinations
  // so that we don't accidentally point to a screen that doesn't exist
  /// `static` keyword here denotes that we can access this class member
  /// without needing to create an object of the class
  /// But we can change it from anywhere
  /// which is why we used `const` keyword alongside to keep it unchangeable
  static const String navRoute = "/register";

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String? email;
  String? password;
  bool isSignUpInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: "logo",
              child: SizedBox(
                height: 200.0,
                child: Image.asset("images/logo.png"),
              ),
            ),
            const SizedBox(height: 36.0),
            RoundTextField(
              hintText: "Enter your email",
              onValueChanged: (String value) {
                setState(() {
                  email = value;
                });
              },
            ),
            const SizedBox(height: 8.0),
            RoundTextField(
              hintText: "Enter your password",
              isPasswordField: true,
              onValueChanged: (String value) {
                setState(() {
                  password = value;
                });
              },
            ),
            RoundButton(
              isPressed: isSignUpInProgress,
              btnText: "Register",
              btnColor: Colors.blueAccent,
              verticalPadding: 20.0,
              onButtonPressed: () {
                // Take Email and Password and register user
                registerUser(
                  context,
                  email,
                  password,
                  () => setState(() => isSignUpInProgress = true),
                  () => setState(() => isSignUpInProgress = false),
                );
              },
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey[300],
              ),
              child: const Text(
                "Already have an account? Login",
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }

  void registerUser(
    BuildContext context,
    String? email,
    String? password,
    Function onStart,
    Function onComplete,
  ) async {
    onStart();

    /// Test User
    // someone@example.com
    // sam@123
    if (email != null && password != null) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          if (context.mounted) {
            Util.showCustomSnackBar(
              context,
              'The password provided is too weak.',
            );
          }
        } else if (e.code == 'email-already-in-use') {
          if (context.mounted) {
            Util.showCustomSnackBar(
              context,
              'The account already exists for that email.',
            );
          }
        } else if (e.code == "invalid-email") {
          if (context.mounted) {
            Util.showCustomSnackBar(
              context,
              "Bad email format supplied",
            );
          }
        }
      }

      onComplete();
    }
  }
}
