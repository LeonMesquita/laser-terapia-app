import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EquipmentCard extends StatelessWidget {
  String equipmentName;
  double potency;
  double beamArea;
  int seconds;
  double energyDensity;
  Color borderColor;
  VoidCallback onclick;
  Widget icon;
  EquipmentCard(
      {required this.equipmentName,
      required this.beamArea,
      required this.energyDensity,
      required this.potency,
      required this.seconds,
      required this.borderColor,
      required this.onclick,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: GestureDetector(
          onTap: onclick,
          child: Container(
            padding: const EdgeInsets.only(bottom: 10),
            width: size.width * .9,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(255),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            // height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  equipmentTitle(equipmentName),
                  equipmentParam(
                      'Potência: ${(potency * 1000).toStringAsFixed(0)}mW (${potency}W)'),
                  equipmentParam('Área do feixe: ${beamArea}cm²'),
                  equipmentParam('Energia de 1J em $seconds segundos'),
                  equipmentParam('Densidade de energia: ${energyDensity}J/cm²'),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        height: 25,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            //   border: Border.all(color: borderColor, width: 1.5),
                            shape: BoxShape.circle),
                        child: icon),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget equipmentTitle(text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget equipmentParam(text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        //fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
