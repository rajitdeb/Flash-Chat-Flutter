import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_flutter/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '/screens/registration_screen.dart';
import '/screens/login_screen.dart';
import '/screens/components/round_button.dart';

class WelcomeScreen extends StatefulWidget {
  // For safe routing to destinations
  // so that we don't accidentally point to a screen that doesn't exist
  /// `static` keyword here denotes that we can access this class member
  /// without needing to create an object of the class
  /// But we can change it from anywhere
  /// which is why we used `const` keyword alongside to keep it unchangeable
  static const String navRoute = "/";

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

/// Providing a TickerProviderStateMixin is a must when using AnimationController
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // AnimationController Declaration
  // late AnimationController controller;

  // Curved Animation
  // late Animation animation;

  @override
  void initState() {
    super.initState();
    checkForFirebaseTokenChanges();

    /// vsync is used to access the ticker provider state class
    /// which in our case is _WelcomeScreenState that is inheriting SingleTickerProviderStateMixin
    // controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 1000),
    // );

    /// We can also have Curved Animation to further controller the Animation Speed
    // animation = CurvedAnimation(
    //   parent: controller,
    //   curve: Curves.decelerate,
    // );

    /// We also have ColorTween animation
    // animation = ColorTween(
    //   begin: Colors.red,
    //   end: Colors.blue,
    // ).animate(controller);

    // We tell the controller to move the animation in forward direction
    // controller.forward();

    // We also have the option to move animation in reverse direction
    // controller.reverse();

    /// We can also use addStatusListener to animation
    // animation.addStatusListener((status) {
    //   // Looping Animation => Forward to Reverse and Vice Versa
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    /// We can also set a listener to check the animation state
    // controller.addListener(() {
    //   // For the animations to take effect,
    //   // we have to call setState with nothing inside it
    //   setState(() {});
    //   log(controller.value.toString());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// For ColorTween Animation
      // backgroundColor: animation.value,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: "logo",
                  child: SizedBox(
                    // height: controller.value * 60.0,
                    height: 60.0,
                    child: Image.asset("images/logo.png"),
                  ),
                ),
                SizedBox(
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "Flash Chat",
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundButton(
              btnText: "Log In",
              btnColor: Colors.lightBlueAccent,
              onButtonPressed: () {
                // Go to Login Screen
                Navigator.pushNamed(context, LoginScreen.navRoute);
              },
            ),
            RoundButton(
              btnText: "Register",
              btnColor: Colors.blueAccent,
              onButtonPressed: () {
                // Go to Registration Screen
                Navigator.pushNamed(context, RegistrationScreen.navRoute);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    /// Animation Controllers are notoriously tricky
    /// They continue to take up resources even if the widget is not visible
    /// So, whenever we use `AnimationController` we should dispose it as well
    // controller.dispose();
    super.dispose();
  }

  void checkForFirebaseTokenChanges() {
    // Navigate directly to Chat Screen if user is already signed in
    FirebaseAuth.instance.idTokenChanges().listen((user) {
      if (user != null) {
        log(user.uid);
        // Move to Chat Screen
        Navigator.pushNamed(context, ChatScreen.navRoute);
      }
    });
  }
}
