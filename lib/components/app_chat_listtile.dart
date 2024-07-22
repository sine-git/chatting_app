import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLChatListtile extends StatelessWidget {
  AppLChatListtile(
      {super.key, required this.email, this.imageUrl, required this.onTap});
  String email;
  String? imageUrl;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: imageUrl != null
              ? NetworkImage(imageUrl!)
              : AssetImage("assets/images/login.jpg"),
        ),
        title: Text(
          email,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        onTap: onTap,
      ),
    );
  }
}
