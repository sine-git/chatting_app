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
              //  width: 500,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        height: 1.2,
                      ),
                      message ?? "Operation successed")
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
              // width: 500,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      message ?? "Operation successed",
                      softWrap: true,

                      // overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        height: 2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
}

closeDialog(BuildContext context) {
  Navigator.pop(context);
}
