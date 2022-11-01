import 'package:flutter/material.dart';

class KnowMoreButton extends StatelessWidget {
  final VoidCallback onpress;
  String? buttonText;
  KnowMoreButton({super.key, required this.onpress, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1F4C26),
        ),
        child: Text(buttonText ?? 'SAIBA MAIS'),
      ),
    );
  }
}
