import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:laser_erapia/components/form_page_body.dart';
import 'package:laser_erapia/components/title_text.dart';
import 'package:laser_erapia/controllers/equipmentController.dart';
import 'package:laser_erapia/controllers/woundController.dart';

import '../../components/default_button.dart';
import '../../controllers/result_controller.dart';
import '../../page_routes/app_pages.dart';
import '../../utils/constants.dart';

class ResumeInformations extends StatelessWidget {
  ResumeInformations({super.key});
  final resultController = Get.find<ResultController>();
  final equipmentController = Get.find<EquipmentController>();

  final woundController = Get.find<WoundController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FormPageBody(children: [
          titleText('Resumo das informações'),
          const SizedBox(height: 30),
          resumeText(
              'Densidade de Energia: ${equipmentController.energyDensity.value.toStringAsFixed(2)}'),
          resumeText(
              'Tipo de tratamento: ${resultController.typeOfTreatment.value}'),
          resumeText(
              'Método de aplicação: ${resultController.applicationMethod.value}'),
          resumeText(
              'Quantidade de pontos a serem aplicados: ${woundController.woundArea.value.toStringAsFixed(0)} pontos'),

          //
          //

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: titleText('Informações da lesão'),
          ),
          resumeText('Etiologia da lesão: ${woundController.etiology.value}'),
          resumeText(
              'Localização da lesão: ${woundController.woundLocation.value}'),
          resumeText(
              'Largura da lesão: ${woundController.woundWidth.value.toStringAsFixed(2)}cm'),
          resumeText(
              'Comprimento da lesão: ${woundController.woundLength.value.toStringAsFixed(2)}cm'),
          resumeText(
              'Tecido predominante: ${woundController.predominantTissue.value}'),
          resumeText(
              'Quantidade de exsudato: ${woundController.exudateAmount.value}'),
          resumeText('Tipo de exsudato: ${woundController.exudateType.value}'),
          resumeText('Bordas da lesão: ${woundController.woundBorders.value}'),
          resumeText(
              'Sinais de infecção: ${woundController.hasInfection.value == true ? 'Sim' : 'Não'}'),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: DefaultButton(
            onpress: () {
              Get.offNamed(PagesRoutes.resultPage);
            },
            buttonText: 'VOLTAR',
            buttonColor: kDefaultButtonColor),
      ),
    );
  }
}

Widget resumeText(text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Text(
      text,
      style: const TextStyle(
          fontSize: 20,
          color: kDefaultButtonColor,
          fontWeight: FontWeight.bold),
    ),
  );
}
