import 'package:chatting_app/components/app_drawer.dart';
import 'package:chatting_app/modules/call_module/pages/call_page.dart';
import 'package:chatting_app/modules/chat_module/pages/chat_list.dart';
import 'package:chatting_app/modules/community_module/pages/community_page.dart';
import 'package:chatting_app/modules/stories_module/pages/stories_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> pages = [
    {"title": "Chats", "page": ChatList()},
    {"title": "Stories", "page": StoriesPages()},
    {"title": "Community", "page": CommunityPage()},
    {"title": "Calls", "page": CallPage()},
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.tertiary),
        title: Text(
          pages[currentIndex]["title"],
          style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: pages[currentIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
        unselectedIconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
        unselectedLabelStyle:
            TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
              label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star_outlined,
              ),
              label: "Stories"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
              ),
              label: "Community"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
              ),
              label: "Calls")
        ],
      ),
    );
  }
}
