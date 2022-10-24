import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laser_erapia/components/default_button.dart';
import 'package:laser_erapia/components/form_area.dart';
import 'package:laser_erapia/components/form_input.dart';
import 'package:laser_erapia/components/form_title.dart';
import 'package:laser_erapia/utils/constants.dart';

class FormPageBody extends StatelessWidget {
  final List<Widget> children;
  const FormPageBody({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    var appBarHeight =
        appbar.preferredSize.height + MediaQuery.of(context).padding.top;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height - appBarHeight;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(kFormBackgroundImage), fit: BoxFit.cover),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
