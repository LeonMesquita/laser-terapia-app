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
      backgroundColor: Color.fromARGB(255, 243, 240, 240),
      appBar: AppBar(
        backgroundColor: kRedColor,
        title: Text('Protocolo de Aplicação'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FormPageBody(children: [
          // titleText('Resumo das informações'),
          // const SizedBox(height: 30),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
            child: title('Parâmetros do seu equipamento'),
          ),
          resumeCard([
            resumeText(
                'Densidade de Energia do seu equipamento: ${equipmentController.energyDensity.value} J/cm²'),
            resumeText(
                'Tipo de tratamento: ${resultController.typeOfTreatment.value}'),
            resumeText(
                'Aplicação: ${resultController.applicationMethod.value}'),
            resumeText(
                'Técnica de aplicação: Técnica pontual com leve contato da ponteira em um ângulo de 90° a uma distância de 01cm² entre os pontos no leito da lesão e nas bordas.'),
            resumeText(
                'Quantidade de pontos a serem aplicados: 1 ponto a cada 1cm² (total ${woundController.woundArea.value.toStringAsFixed(0)} pontos)'),
          ]),

          //
          //

          Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
            child: title('Informações da lesão'),
          ),

          resumeCard([
            resumeText('Etiologia da lesão: ${woundController.etiology.value}'),
            resumeText(
                'Localização da lesão: ${woundController.woundLocation.value}'),
            resumeText(
                'Largura da lesão: ${woundController.woundWidth.value.toStringAsFixed(2)}cm'),
            resumeText(
                'Comprimento da lesão: ${woundController.woundLength.value.toStringAsFixed(2)}cm'),
            resumeText(
                'Área da lesão: ${woundController.woundArea.value.toStringAsFixed(2)}cm²'),
            resumeText(
                'Tecido predominante: ${woundController.predominantTissue.value}'),
            resumeText(
                'Quantidade de exsudato: ${woundController.exudateAmount.value}'),
            resumeText(
                'Tipo de exsudato: ${woundController.exudateType.value}'),
            resumeText(
                'Bordas da lesão: ${woundController.woundBorders.value}'),
            resumeText(
                'Sinais de infecção: ${woundController.hasInfection.value == true ? 'Sim' : 'Não'}'),
          ]),
          SizedBox(height: 250),
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
        color: Colors.black,
        //  fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget resumeCard(children) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...children,
      ],
    ),
  );
}

Widget title(text) {
  return Center(
    child: Text(
      text,
      style: const TextStyle(
        color: kRedColor,
        fontSize: 30,
        fontWeight: FontWeight.w900,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
