import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigationBarItem item;
  BottomNavigation({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: <BottomNavigationBarItem>[item]);
  }
}
