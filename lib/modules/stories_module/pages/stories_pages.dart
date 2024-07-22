import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoriesPages extends StatefulWidget {
  const StoriesPages({super.key});

  @override
  State<StoriesPages> createState() => _StoriesPagesState();
}

class _StoriesPagesState extends State<StoriesPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Stories page"),
      ),
    );
  }
}
