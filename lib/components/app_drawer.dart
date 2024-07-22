import 'package:chatting_app/modes/dark_mode.dart';
import 'package:chatting_app/modes/light_mode.dart';
import 'package:chatting_app/modes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(70),
            child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  "assets/images/login.jpg",
                )),
          ),
          ListTile(
            leading: Icon(
              Icons.chat,
              color: Colors.deepPurple,
            ),
            title: Text(
              "Chats",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          ListTile(
            leading: Icon(Icons.star_outlined, color: Colors.deepPurple),
            title: Text(
              "Stories",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.deepPurple,
            ),
            title: Text(
              "Community",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.call,
              color: Colors.deepPurple,
            ),
            title: Text(
              "Calls",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.deepPurple,
            ),
            title: Text("Settings",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary)),
          ),
          ListTile(
              leading: Icon(
                Icons.dark_mode,
                color: Colors.deepPurple,
              ),
              title: Text("Dark mode",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary)),
              onTap: () {
                Modular.to.navigate("/login");
              },
              trailing: Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                    value: Provider.of<ThemeProvider>(context, listen: false)
                            .themeData ==
                        darkMode,
                    onChanged: (value) {
                      setState(() {
                        ThemeData themeData =
                            Provider.of<ThemeProvider>(context, listen: false)
                                .toggleTheme();
                      });
                    }),
              )),
          Spacer(),
          ListTile(
            leading: Icon(
              Icons.logout_rounded,
              color: Colors.deepPurple,
            ),
            title: Text("Log out",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary)),
            onTap: () {
              Modular.to.navigate("/login");
            },
          ),
        ],
      ),
    );
  }
}
