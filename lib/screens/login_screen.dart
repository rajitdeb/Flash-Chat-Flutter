import 'package:flutter/material.dart';

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
              onValueChanged: (value) {},
            ),
            const SizedBox(height: 8.0),
            RoundTextField(
              hintText: "Enter your password",
              isPasswordField: true,
              onValueChanged: (value) {},
            ),
            RoundButton(
              btnText: "Log In",
              verticalPadding: 24.0,
              onButtonPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
