import 'package:chatting_app/app_utils.dart';
import 'package:chatting_app/components/app_textfield.dart';
import 'package:chatting_app/components/message_bubble.dart';
import 'package:chatting_app/modules/auth_module/auth_service.dart';
import 'package:chatting_app/modules/chat_module/chat_service.dart';
import 'package:chatting_app/modules/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatRoom extends StatefulWidget {
  ChatRoom({super.key, required this.email, required this.userId});

  String email;
  String userId;

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final ChatService _chatService = Modular.get<ChatService>();
  final AuthService _authService = Modular.get<AuthService>();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  @override
  initState() {
    print("The recever ID is ${widget.userId}");

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        Future.delayed(Duration(milliseconds: 500), () {
          _scrollDown();
        });
      }
    });

    Future.delayed(Duration(milliseconds: 500), () {
      _scrollDown();
    });
  }

  @override
  dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  _scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
  }

  _sendMessage(newMessage, senderId, receiverId) {
    try {
      Message message = Message(
          message: newMessage,
          senderId: senderId,
          receiverId: receiverId,
          timestamp: Timestamp.now().toString());
      _chatService.sendMessage(message);
      _scrollDown();
      _messageController.clear();
      _focusNode.unfocus();

      print("Message envoyé");
    } catch (e) {
      showError(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(widget.email),
      ),
      body: Column(children: [
        Expanded(
          child: StreamBuilder(
            stream: _chatService.getMessages(widget.userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("Impossible to get the messages"));
              } else {
                print(
                    "Room Id is ${_authService.currentUser!.uid}_${widget.userId}");

                var messages = snapshot.data!.docs.map((doc) => doc.data());
                print("Liste des messages ${messages}");
                return ListView(
                  controller: _scrollController,
                  children: snapshot.data!.docs.map((doc) {
                    var data = doc.data() as Map<String, dynamic>;
                    print("Data is ${data}");
                    return MessageBubble(
                        isCurrentUser:
                            data["senderId"] == _authService.currentUser!.uid,
                        message: data["message"]);
                  }).toList(),
                );
              }
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                  focusNode: _focusNode,
                  fillColors: Theme.of(context).colorScheme.tertiary,
                  hintText: "",
                  obscureText: false,
                  label: "",
                  controller: _messageController),
            ),
            IconButton(
              onPressed: () {
                _sendMessage(_messageController.text,
                    _authService.currentUser!.uid, widget.userId);
              },
              icon: Icon(
                Icons.send,
                size: 30,
              ),
              color: Theme.of(context).colorScheme.primary,
            )
          ],
        )
      ]),
    );
  }
}
