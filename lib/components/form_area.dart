import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormArea extends StatelessWidget {
  final List<Widget> children;
  const FormArea({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    var appBarHeight =
        appbar.preferredSize.height + MediaQuery.of(context).padding.top;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height - appBarHeight;
    return Center(
      child: Container(
        padding: const EdgeInsets.only(bottom: 20, top: 10),
        margin: const EdgeInsets.only(top: 50),
        width: size.width * .9,
        decoration: BoxDecoration(
          color: Color(0xFFDCDCDC),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
