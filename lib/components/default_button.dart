import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onpress;
  final String buttonText;
  final Color buttonColor;
  const DefaultButton(
      {super.key,
      required this.onpress,
      required this.buttonText,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 65,
      width: size.width * .7,
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1F4C26),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
