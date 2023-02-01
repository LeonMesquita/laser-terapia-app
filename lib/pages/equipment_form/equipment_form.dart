import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:laser_erapia/components/bottom_navigation.dart';
import 'package:laser_erapia/components/default_button.dart';
import 'package:laser_erapia/components/form_area.dart';
import 'package:laser_erapia/components/form_input.dart';
import 'package:laser_erapia/components/form_page_body.dart';
import 'package:laser_erapia/components/form_title.dart';
import 'package:laser_erapia/controllers/equipmentController.dart';
import 'package:laser_erapia/controllers/result_controller.dart';
import 'package:laser_erapia/page_routes/app_pages.dart';
import 'package:laser_erapia/utils/alert_dialog.dart';
import 'package:laser_erapia/utils/constants.dart';

class EquipmentForm extends StatefulWidget {
  const EquipmentForm({super.key});

  @override
  State<EquipmentForm> createState() => _EquipmentFormState();
}

class _EquipmentFormState extends State<EquipmentForm> {
  var waveLengthController = TextEditingController();
  var potencyController = TextEditingController();
  var areaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final equipmentController = Get.find<EquipmentController>();
  final resultController = Get.find<ResultController>();

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    var appBarHeight =
        appbar.preferredSize.height + MediaQuery.of(context).padding.top;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height - appBarHeight;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRedColor,
      ),
      body: Form(
        key: _formKey,
        child: FormPageBody(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              // child: Text(
              //   'Calibrando equipamento',
              //   style: kFormTitleStyle,
              //   textAlign: TextAlign.start,
              // ),
            ),
            Text(
              'Preencha os dados de acordo com seu equipamento de laserterapia',
              style: kFormSubtitleStyle,
            ),
            Center(
                child: FormArea(
              children: [
                formTitle(text: 'Comprimento de onda'),
                FormInput(
                  hintText: 'Digite em nm',
                  inputController: waveLengthController,
                ),
                formTitle(text: 'Potência'),
                FormInput(
                  hintText: 'Digite em W',
                  inputController: potencyController,
                ),
                formTitle(text: 'Área do feixe'),
                FormInput(
                  hintText: 'Digite em cm²',
                  inputController: areaController,
                ),
              ],
            )
                //Color(0xFFF2F1F1)
                ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: DefaultButton(
            onpress: () {
              // FocusScope.of(context).unfocus();
              // if (_formKey.currentState!.validate()) {
              //   final double length = double.parse(waveLengthController.text);
              //   final double potency =
              //       double.parse(potencyController.text.replaceAll(',', '.'));
              //   final double area = double.parse(areaController.text);

              //   if (length < 600 || length > 2000) {
              //     showAlert(
              //         context: context,
              //         title:
              //             'Comprimento de onda contraindicado para o tratamento',
              //         desc: 'Recomenda-se de 600nm a 2000nm.');
              //   } else if (potency >= 1) {
              //     showAlert(
              //         context: context,
              //         title: 'Potência contraindicada para o tratamento.',
              //         desc: 'Recomenda-se abaixo de 1W');
              //   } else {
              //     equipmentController.setData(
              //       length: length,
              //       pot: potency,
              //       area: area,
              //     );

              //     equipmentController.calculateDensity();

              //     Get.offNamed(PagesRoutes.woundForm);
              //   }
              // } else {}
            },
            buttonText: 'PROSSEGUIR',
            buttonColor: kDefaultButtonColor),
      ),
    );
  }
}
