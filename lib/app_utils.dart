import 'package:flutter/material.dart';

showLoading(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Center(
            child: CircularProgressIndicator(),
          ));
}

showSuccess(BuildContext context, String? message) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Container(
              width: 500,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.check_circle_rounded),
                  ),
                  Text(message ?? "Operation successed")
                ],
              ),
            ),
          ));
}

showError(BuildContext context, String? message) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Container(
              width: 500,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                  Text(message ?? "Operation successed")
                ],
              ),
            ),
          ));
}

closeDialog(BuildContext context) {
  Navigator.pop(context);
}
