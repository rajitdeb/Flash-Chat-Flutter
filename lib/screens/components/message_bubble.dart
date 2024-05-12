import 'package:flash_chat_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String messageText;
  final String messageSender;
  final bool isUser;

  const MessageBubble({
    super.key,
    required this.messageText,
    required this.messageSender,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            isUser ? "You" : messageSender,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isUser
                ? kUserMessageBubbleBorderRadius
                : kOtherSenderMessageBubbleBorderRadius,
            elevation: 8.0,
            color: (isUser) ? Colors.blue.shade900 : Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Text(
                messageText,
                textAlign: TextAlign.start,
                style: TextStyle(
                  // color: (getUserEmail() == messageSender) ? Colors.white : Colors.black,
                  color: isUser ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
