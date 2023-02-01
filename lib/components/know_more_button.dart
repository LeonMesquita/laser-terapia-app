import 'package:flutter/material.dart';
import 'package:laser_erapia/utils/constants.dart';

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
          backgroundColor: kRedColor,
        ),
        child: Text(buttonText ?? 'SAIBA MAIS'),
      ),
    );
  }
}
