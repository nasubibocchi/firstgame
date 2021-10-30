import 'package:flutter/material.dart';

class CommonFunctions {
  Future<void> myShowDialog(
      BuildContext context, String message, Function() onTap) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(message,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 18.0)),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ///OK
                  OutlinedButton(
                    onPressed: onTap,
                    style: OutlinedButton.styleFrom(
                      elevation: 5.0,
                      backgroundColor: Colors.white,
                      shape: const StadiumBorder(),
                      side: const BorderSide(color: Colors.black54),
                    ),
                    child: const Text('OK',
                        style:
                            TextStyle(color: Colors.black54, fontSize: 18.0)),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
