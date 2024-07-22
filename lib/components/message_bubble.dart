import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
      {super.key, required this.isCurrentUser, required this.message});
  String message;
  bool isCurrentUser;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          child: Text(
            message,
            style: TextStyle(
                color: isCurrentUser
                    ? Theme.of(context).colorScheme.inverseSurface
                    : Theme.of(context).colorScheme.tertiary),
          ),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 0.1,
                )
              ],
              borderRadius: BorderRadius.circular(15),
              color: isCurrentUser
                  ? Theme.of(context).colorScheme.tertiary
                  : Colors.green),
        )
      ],
    );
  }
}
