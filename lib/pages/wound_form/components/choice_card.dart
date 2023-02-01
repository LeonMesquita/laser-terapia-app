import 'package:flutter/material.dart';

Widget choiceCard(List<Widget> children) {
  return Container(
    margin: const EdgeInsets.only(bottom: 30),
    padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
    decoration: BoxDecoration(
      // border: Border.all(),
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      children: [
        ...children,
      ],
    ),
  );
}
