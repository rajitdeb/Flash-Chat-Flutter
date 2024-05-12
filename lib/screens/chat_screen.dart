import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/screens/components/message_stream.dart';
import '/screens/welcome_screen.dart';
import '/utilities/constants.dart';
import '/utilities/util.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  // Firebase Instances
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FocusNode _focusNode = FocusNode();

  // Util Variables
  String messageText = "";
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

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
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
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
            MessageStream(
              messagesStream: _firestore
                  .collection("messages")
                  .orderBy("timestamp",
                      descending: true) // for maintaining proper order
                  .snapshots(),
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
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
                        // To hide soft keyboard after message sent
                        _focusNode.unfocus();
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

  /// Logs Out the User and navigates the user to the Welcome Screen
  void signOutUser() async {
    await FirebaseAuth.instance.signOut().whenComplete(() {
      log("Log Out Successful");
      // Navigate to Welcome Screen
      Navigator.popUntil(context, ModalRoute.withName(WelcomeScreen.navRoute));
    });
  }

  void sendMessage(String messageText) {
    DateTime currentTimestamp = DateTime.now();
    String formattedCurrentTimestamp =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(currentTimestamp);

    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "text": messageText,
      "sender": Util.getUserEmail(),
      "timestamp": formattedCurrentTimestamp,
    };

    // Add a new document with a generated ID
    _firestore.collection("messages").add(user).then(
      (DocumentReference doc) {
        // Inform the user that the message is sent
        Util.showCustomSnackBar(context, "Message Sent!");

        // Clear the text field
        setState(() {
          messageText = "";
          _controller.clear();
        });
      },
    );
  }
}
