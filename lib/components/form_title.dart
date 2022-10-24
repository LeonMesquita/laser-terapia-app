import 'package:flutter/material.dart';

Widget formTitle({required text}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 25,
        color: Color(0xFF2F983F),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
