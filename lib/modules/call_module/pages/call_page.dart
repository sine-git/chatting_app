import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Call page",
          style:
              TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
    );
  }
}
