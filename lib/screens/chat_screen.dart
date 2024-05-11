import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_flutter/screens/welcome_screen.dart';
import 'package:flash_chat_flutter/utilities/constants.dart';
import 'package:flash_chat_flutter/utilities/util.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  // For safe routing to destinations
  // so that we don't accidentally point to a screen that doesn't exist
  /// `static` keyword here denotes that we can access this class member
  /// without needing to create an object of the class
  /// But we can change it from anywhere
  /// which is why we used `const` keyword alongside to keep it unchangeable
  static const String navRoute = "/chat";

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String messageText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                signOutUser();
              });
            },
            icon: const Icon(Icons.close),
          ),
        ],
        title: const Text("⚡ Flash Chat"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (String value) {
                        setState(() {
                          messageText = value;
                        });
                      },
                      decoration: kMessageTextFieldDecoration,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (messageText.isNotEmpty) {
                        sendMessage(messageText);
                      } else {
                        Util.showCustomSnackBar(
                          context,
                          "Enter some message to be sent",
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.lightBlueAccent,
                    ),
                    child: const Text(
                      "Send",
                      style: kMessageSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signOutUser() async {
    await FirebaseAuth.instance.signOut().whenComplete(() {
      log("Log Out Successful");
      // Navigate to Welcome Screen
      Navigator.popUntil(context, ModalRoute.withName(WelcomeScreen.navRoute));
    });
  }

  void sendMessage(String messageText) {
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "text": messageText,
      "sender": getUserEmail(),
    };

    // Add a new document with a generated ID
    FirebaseFirestore.instance
        .collection("messages")
        .add(user)
        .then((DocumentReference doc) {
      Util.showCustomSnackBar(context, "Message Sent!");
    });
  }

  String getUserEmail() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.email!;
    } else {
      return "Not Available";
    }
  }
}
