import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat_flutter/utilities/util.dart';
import 'package:flutter/material.dart';

import '/screens/components/message_bubble.dart';

class MessageStream extends StatelessWidget {
  final Stream<QuerySnapshot<Map<String, dynamic>>> messagesStream;

  const MessageStream({super.key, required this.messagesStream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: messagesStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data!.docs;
          List<Widget> textWidgets = [];

          /// To show oldest messages first & latest at the end
          for (var message in messages) {
            final messageText = message.data()["text"];
            final messageSender = message.data()["sender"];

            final messageWidget = MessageBubble(
              messageText: messageText,
              messageSender: messageSender,
              isUser: (Util.getUserEmail() == messageSender),
            );

            textWidgets.add(messageWidget);
          }
          return Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: textWidgets.length,
              itemBuilder: (BuildContext context, int index) =>
                  textWidgets[index],
              // children: textWidgets,
            ),
          );
        } else {
          return const Expanded(
            child: Center(child: Text("No messages found")),
          );
        }
      },
    );
  }
}
