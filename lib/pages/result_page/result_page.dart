import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:laser_erapia/components/default_button.dart';
import 'package:laser_erapia/components/form_page_body.dart';
import 'package:laser_erapia/components/know_more_button.dart';
import 'package:laser_erapia/components/title_text.dart';

import '../../controllers/result_controller.dart';
import '../../page_routes/app_pages.dart';
import '../../utils/constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({super.key});

  final resultController = Get.find<ResultController>();

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    var appBarHeight =
        appbar.preferredSize.height + MediaQuery.of(context).padding.top;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height - appBarHeight;
    var paddingHeight = MediaQuery.of(context).padding.top;

    final observations = List<Widget>.generate(
        resultController.observations.length,
        (index) => Text(
              '* ${resultController.observations[index]}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ));
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 243, 240, 240),
      appBar: AppBar(
        backgroundColor: kRedColor,
        title: const Text(
          'Resultados',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FormPageBody(children: [
          // const Padding(
          //   padding: EdgeInsets.only(left: 20),
          //   child: Text(
          //     'Resultados',
          //     style: kFormTitleStyle,
          //     textAlign: TextAlign.start,
          //   ),
          // ),
          // const Padding(
          //   padding: EdgeInsets.only(left: 20, right: 5),
          //   child: Text(
          //     'De acordo com suas respostas, analisamos as melhores situações para o paciente.',
          //     style: kFormSubtitleStyle,
          //   ),
          // ),
          const SizedBox(height: 30),
          Center(
            child: Image.asset(
              'assets/images/check.png',
              height: 100,
            ),
          ),
          const SizedBox(height: 10),
          Center(child: titleText(resultController.result.value)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Observações',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 10),
                  ...observations
                ],
              ),
            ),
          ),
          //  Text(resultController.typeOfTreatment.value),
          KnowMoreButton(
            onpress: () {
              Get.offNamed(PagesRoutes.resumeInformations);
            },
            buttonText: 'PROTOCOLO DE APLICAÇÃO',
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: DefaultButton(
            onpress: () {
              Get.offNamed(PagesRoutes.chooseEquipment);
            },
            buttonText: 'NOVA CONSULTA',
            buttonColor: kDefaultButtonColor),
      ),
    );
  }
}
