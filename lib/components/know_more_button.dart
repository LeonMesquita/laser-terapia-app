import 'package:flutter/material.dart';

class KnowMoreButton extends StatelessWidget {
  final VoidCallback onpress;
  const KnowMoreButton({super.key, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1F4C26),
      ),
      child: const Text('SAIBA MAIS'),
    );
  }
}
