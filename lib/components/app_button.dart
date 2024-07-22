import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton({super.key, required this.text, required this.onTap});
  String text;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Opacity(
          opacity: onTap != null ? 1 : 0.5,
          child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8)),
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}
