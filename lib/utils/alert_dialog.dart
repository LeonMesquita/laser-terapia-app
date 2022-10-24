import 'package:flutter/material.dart';

void alertDialog(
    {required BuildContext context,
    required message,
    VoidCallback? onpress,
    String? buttonText}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
            onPressed: onpress ??
                () {
                  Navigator.of(context).pop();
                },
            child: Text(
              buttonText ?? 'Entendi',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ],
    ),
  );
}
