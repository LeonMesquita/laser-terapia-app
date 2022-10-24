import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laser_erapia/components/form_page_body.dart';
import 'package:laser_erapia/components/title_text.dart';

import '../../utils/constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    var appBarHeight =
        appbar.preferredSize.height + MediaQuery.of(context).padding.top;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height - appBarHeight;
    var paddingHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: FormPageBody(children: [
        SizedBox(height: paddingHeight + 10),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Resultados',
            style: kFormTitleStyle,
            textAlign: TextAlign.start,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 5),
          child: Text(
            'De acordo com suas respostas, analisamos as melhores situações para o paciente.',
            style: kFormSubtitleStyle,
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: Image.asset(
            'assets/images/check.png',
            height: 120,
          ),
        ),
        const SizedBox(height: 10),
        Center(child: titleText('Paciente indicado para laserterapia'))
      ]),
    );
  }
}
