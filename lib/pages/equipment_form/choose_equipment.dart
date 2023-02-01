import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:laser_erapia/components/form_page_body.dart';
import 'package:laser_erapia/models/equipments.dart';
import 'package:laser_erapia/pages/equipment_form/components/equipment_card.dart';

import '../../components/default_button.dart';
import '../../controllers/equipmentController.dart';
import '../../page_routes/app_pages.dart';
import '../../utils/alert_dialog.dart';
import '../../utils/constants.dart';

class ChooseEquipment extends StatefulWidget {
  const ChooseEquipment({super.key});

  @override
  State<ChooseEquipment> createState() => _ChooseEquipmentState();
}

int? selectedEquipment = null;
final equipmentController = Get.find<EquipmentController>();

class _ChooseEquipmentState extends State<ChooseEquipment> {
  @override
  Widget build(BuildContext context) {
    final equipmentsList = List<EquipmentCard>.generate(
      equipments.length,
      (index) => EquipmentCard(
        equipmentName: equipments[index].equipmentName,
        potency: equipments[index].potency,
        beamArea: equipments[index].beamArea,
        seconds: equipments[index].seconds,
        energyDensity: equipments[index].energyDensity,
        borderColor:
            selectedEquipment == index ? Colors.green : Colors.transparent,
        icon: selectedEquipment == index
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 25,
              )
            : const SizedBox(),
        onclick: () {
          setState(() {
            selectedEquipment = index;
          });
        },
      ),
    );
    return Scaffold(
// Color(0xFFE5E5E5),
//Color(0xFFE0E0DE),
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: kRedColor,
        title: Text('Selecione o equipamento'),
        centerTitle: true,
      ),
      body: FormPageBody(children: [
        ...equipmentsList,
      ]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: DefaultButton(
            onpress: () {
              if (selectedEquipment == null) {
                showAlert(
                    context: context,
                    title: 'Selecione um equipamento!',
                    desc:
                        'Você deve selecionar um equipamento para continuar.');
              } else {
                equipmentController.setData(equipments[selectedEquipment!]);
                Get.offNamed(PagesRoutes.woundForm);
              }
            },
            buttonText: 'PROSSEGUIR',
            buttonColor: kDefaultButtonColor),
      ),
    );
  }
}
