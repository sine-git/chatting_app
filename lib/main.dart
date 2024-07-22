import 'package:chatting_app/firebase_options.dart';
import 'package:chatting_app/modes/light_mode.dart';
import 'package:chatting_app/modes/theme_provider.dart';
import 'package:chatting_app/modules/auth_module/pages/login_page.dart';
import 'package:chatting_app/modules/main_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "Chatting App", options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: ModularApp(module: MainModule(), child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        theme: Provider.of<ThemeProvider>(context).themeData);
  }
}
