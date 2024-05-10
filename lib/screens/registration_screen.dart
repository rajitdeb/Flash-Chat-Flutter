import 'package:flutter/material.dart';

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
              btnText: "Register",
              btnColor: Colors.blueAccent,
              verticalPadding: 20.0,
              onButtonPressed: () {},
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
}
