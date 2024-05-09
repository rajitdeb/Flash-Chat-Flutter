import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Material(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(32.0),
              elevation: 8.0,
              child: MaterialButton(
                onPressed: () {},
                minWidth: 200.0,
                height: 42.0,
                child: const Text("Register"),
              ),
            ),
            const SizedBox(
              height: 8.0,
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
