import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utilities/util.dart';
import '/screens/components/round_button.dart';
import '/screens/components/round_text_field.dart';

class LoginScreen extends StatefulWidget {
  // For safe routing to destinations
  // so that we don't accidentally point to a screen that doesn't exist
  /// `static` keyword here denotes that we can access this class member
  /// without needing to create an object of the class
  /// But we can change it from anywhere
  /// which is why we used `const` keyword alongside to keep it unchangeable
  static const String navRoute = "/login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  bool isLoginInProgress = false;

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
              isPressed: isLoginInProgress,
              btnText: "Log In",
              verticalPadding: 24.0,
              onButtonPressed: () {
                // Take Email and Password and login user
                loginUser(
                  context,
                  email,
                  password,
                  () => setState(() => isLoginInProgress = true),
                  () => setState(() => isLoginInProgress = false),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void loginUser(
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
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found") {
          if (context.mounted) {
            Util.showCustomSnackBar(context, "No user found for that email");
          }
        } else if (e.code == "wrong-password") {
          if (context.mounted) {
            Util.showCustomSnackBar(
                context, "Wrong password provided for that user");
          }
        } else if (e.code == "invalid-credential") {
          if (context.mounted) {
            Util.showCustomSnackBar(
              context,
              "Invalid email or password entered",
            );
          }
        }
      }
      onComplete();
    }
  }
}
