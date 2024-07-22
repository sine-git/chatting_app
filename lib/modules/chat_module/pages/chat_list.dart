import 'package:chatting_app/components/app_chat_listtile.dart';
import 'package:chatting_app/modules/auth_module/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final AuthService _authService = Modular.get<AuthService>();

  Stream<List<Map<String, dynamic>>> _getUsers() {
    return _authService.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _authService.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Impossible de récuperer la liste des utilisateur"),
            );
          } else {
            return ListView(
              children: snapshot.data!.map((data) {
                return AppLChatListtile(
                  email: data["email"],
                  onTap: () {
                    print("Data uid is ${data["uid"]}");
                    Modular.to.pushNamed("/chats/chatroom", arguments: {
                      "email": data["email"],
                      "userId": data["uid"]
                    });
                  },
                );
              }).toList(),
            );
          }
        });
  }
}
