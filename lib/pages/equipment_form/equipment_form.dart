import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:laser_erapia/components/default_button.dart';
import 'package:laser_erapia/components/form_area.dart';
import 'package:laser_erapia/components/form_input.dart';
import 'package:laser_erapia/components/form_page_body.dart';
import 'package:laser_erapia/components/form_title.dart';
import 'package:laser_erapia/controllers/equipmentController.dart';
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

  // void _showDialog({required message}) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       actionsAlignment: MainAxisAlignment.center,
  //       title: Padding(
  //         padding: EdgeInsets.only(bottom: 20),
  //         child: Text(
  //           message,
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //       actions: [
  //         Padding(
  //           padding: const EdgeInsets.only(top: 20),
  //           child: ElevatedButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text(
  //               'Entendi',
  //               style: TextStyle(fontSize: 15),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    var appBarHeight =
        appbar.preferredSize.height + MediaQuery.of(context).padding.top;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height - appBarHeight;

    final equipmentController = Get.find<EquipmentController>();

    return Scaffold(
        body: Form(
      key: _formKey,
      child: FormPageBody(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 10),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Calibrando equipamento',
              style: kFormTitleStyle,
              textAlign: TextAlign.start,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Preencha os dados de acordo com seu equipamento de laserterapia',
              style: kFormSubtitleStyle,
            ),
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
          SizedBox(height: screenHeight * .1),
          DefaultButton(
            onpress: () {
              FocusScope.of(context).unfocus();
              if (_formKey.currentState!.validate()) {
                final double length = double.parse(waveLengthController.text);
                final double potency =
                    double.parse(potencyController.text.replaceAll(',', '.'));
                final double area = double.parse(areaController.text);

                if (length < 600 || length > 2000) {
                  alertDialog(
                    context: context,
                    message:
                        'Comprimento de onda contraindicado para o tratamento. \n Recomenda-se de 600nm a 2000nm.',
                  );
                } else if (potency >= 1) {
                  alertDialog(
                    context: context,
                    message:
                        'Potência contraindicada para o tratamento. \n Recomenda-se abaixo de 1W',
                  );
                } else {
                  equipmentController.setData(
                    length: length,
                    pot: potency,
                    area: area,
                  );
                  alertDialog(
                      context: context,
                      buttonText: 'Prosseguir',
                      message:
                          'A densidade de energia é ${equipmentController.energyDensity}',
                      onpress: () {
                        Get.offNamed(PagesRoutes.woundForm);
                      });
                }
              } else {}
            },
            buttonText: 'PROSSEGUIR',
            buttonColor: kDefaultButtonColor,
          ),
        ],
      ),
    ));
  }
}
