import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laser_erapia/utils/constants.dart';

class RadioButtons extends StatefulWidget {
  VoidCallback onPressYes;
  VoidCallback onPressNo;
  RadioButtons({super.key, required this.onPressNo, required this.onPressYes});

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  Object? _value = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Radio(
            activeColor: kDefaultButtonColor,
            // overlayColor: MaterialStateProperty.all(Colors.white),
            value: 1,
            groupValue: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
              widget.onPressNo();
            },
          ),
          const Text(
            'Não',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 30),
          Radio(
            activeColor: kDefaultButtonColor,
            value: 2,
            groupValue: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
              widget.onPressYes();
            },
          ),
          const Text(
            'Sim',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
