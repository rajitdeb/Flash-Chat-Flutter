import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
          bodyMedium: TextStyle(color: Colors.black54),
          bodySmall: TextStyle(color: Colors.black54),
        ),
        textSelectionTheme: const TextSelectionThemeData().copyWith(
          cursorColor: Colors.lightBlueAccent,
          selectionColor: Colors.lightBlue[50],
          selectionHandleColor: Colors.lightBlue,
        ),
      ),
      initialRoute: WelcomeScreen.navRoute,
      routes: {
        WelcomeScreen.navRoute: (context) => const WelcomeScreen(),
        LoginScreen.navRoute: (context) => const LoginScreen(),
        RegistrationScreen.navRoute: (context) => const RegistrationScreen(),
        ChatScreen.navRoute: (context) => const ChatScreen(),
      },
    );
  }
}
