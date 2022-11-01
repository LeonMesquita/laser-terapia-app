import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../controllers/woundController.dart';

class DropdownList extends StatefulWidget {
  List<String> listItems = [];
  String fieldName;
  DropdownList({super.key, required this.listItems, required this.fieldName});

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  String? initialValue;

  void setData(choice) {
    if (widget.fieldName == 'etiology') {
      woundController.etiology.value = choice;
    } else if (widget.fieldName == 'woundLocation') {
      woundController.woundLocation.value = choice;
    } else if (widget.fieldName == 'predominantTissue') {
      woundController.predominantTissue.value = choice;
    } else if (widget.fieldName == 'exudateAmount') {
      woundController.exudateAmount.value = choice;
    } else if (widget.fieldName == 'exudateType') {
      woundController.exudateType.value = choice;
    } else if (widget.fieldName == 'woundBorders') {
      woundController.woundBorders.value = choice;
    }
  }

  final woundController = Get.find<WoundController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        height: 50,
        width: size.width * .7,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade700, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
          hint: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Selecione uma opção',
              style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
            ),
          ),
          value: initialValue ?? null,
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.green,
            size: 40,
          ),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          isExpanded: true,
          onChanged: (String? newValue) {
            setState(() {
              //dropdownValue = newValue!;

              initialValue = newValue!;
              setData(newValue);
            });
          },
          items: widget.listItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            );
          }).toList(),
        )),
      ),
    );
  }
}
