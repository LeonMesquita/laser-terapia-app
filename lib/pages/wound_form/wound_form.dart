import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laser_erapia/components/default_button.dart';
import 'package:laser_erapia/components/dropdown_menu.dart';
import 'package:laser_erapia/components/form_area.dart';
import 'package:laser_erapia/components/form_page_body.dart';
import 'package:laser_erapia/controllers/woundController.dart';
import 'package:laser_erapia/page_routes/app_pages.dart';
import 'package:laser_erapia/utils/alert_dialog.dart';

import '../../components/form_input.dart';
import '../../components/form_title.dart';
import '../../utils/constants.dart';

class WoundForm extends StatefulWidget {
  const WoundForm({super.key});

  @override
  State<WoundForm> createState() => _WoundFormState();
}

class _WoundFormState extends State<WoundForm> {
  var etiologyController = TextEditingController();
  var locationController = TextEditingController();
  var widthController = TextEditingController();
  var lengthController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    var appBarHeight =
        appbar.preferredSize.height + MediaQuery.of(context).padding.top;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height - appBarHeight;
    var paddingHeight = MediaQuery.of(context).padding.top;

    final woundController = Get.find<WoundController>();

    return Scaffold(
      body: Form(
        key: _formKey,
        child: FormPageBody(children: [
          SizedBox(height: paddingHeight + 10),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Avaliando a ferida',
              style: kFormTitleStyle,
              textAlign: TextAlign.start,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Preencha com as características examinadas na lesão do paciente',
              style: kFormSubtitleStyle,
            ),
          ),
          FormArea(
            children: [
              formTitle(text: 'Etiologia'),
              FormInput(
                hintText: 'Digite aqui',
                inputController: etiologyController,
                isText: true,
              ),
              formTitle(text: 'Localização anatômica'),
              FormInput(
                hintText: 'Digite aqui',
                inputController: locationController,
                isText: true,
              ),
              formTitle(text: 'Largura da lesão'),
              FormInput(
                hintText: 'Digite em cm',
                inputController: widthController,
              ),
              formTitle(text: 'Comprimento da lesão'),
              FormInput(
                hintText: 'Digite em cm',
                inputController: lengthController,
              ),
              formTitle(text: 'Tecido predominante'),
              DropdownList(
                listItems: const [
                  'Pele com eritemia ou sutura',
                  'Granulação',
                  'Epitélio',
                  'Necrose preta, cinza ou esfacelos'
                ],
                selectedValue: woundController.predominantTissue.value,
              ),
              formTitle(text: 'Quantidade de exsudato'),
              DropdownList(
                listItems: const ['Nenhum', 'Pouco', 'Moderado', 'Acentuado'],
                selectedValue: woundController.exudateAmount.value,
              ),

              formTitle(text: 'Tipo de resultado'),
              DropdownList(
                listItems: const [
                  'Seroso ou serosanguinolento',
                  'Sanguinolento com sangramento ativo',
                  'Seropurulento ou purulento',
                ],
                selectedValue: woundController.resultType.value,
              ),

              formTitle(text: 'Bordas'),
              DropdownList(
                listItems: const [
                  'Regular ou irregular, aderida',
                  'Descolada',
                  'Masceração',
                  'Hiperqueratose'
                ],
                selectedValue: woundController.woundBorders.value,
              ),

              //OBS: essa é a última pergunta
              formTitle(text: 'Sinais de infecção'),
            ],
          ),
          SizedBox(height: screenHeight * .07),
          DefaultButton(
              onpress: () {
                FocusScope.of(context).unfocus();
                if (_formKey.currentState!.validate()) {
                  final String etiology = etiologyController.text;

                  if (etiology == 'oncologica' ||
                      etiology == 'cancer' ||
                      etiology == 'carcinoma sem diagnostico' ||
                      etiology == 'nao sei') {
                    alertDialog(
                        context: context,
                        message:
                            'O tratamento é contraindicado para este tipo de etiologia.');
                  }

                  Get.offNamed(PagesRoutes.resultPage);
                } else {}
              },
              buttonText: 'PROSSEGUIR',
              buttonColor: kDefaultButtonColor)
        ]),
      ),
    );
  }
}
