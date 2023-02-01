import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laser_erapia/components/default_button.dart';
import 'package:laser_erapia/controllers/result_controller.dart';
import 'package:laser_erapia/pages/wound_form/components/choice_card.dart';
import 'package:laser_erapia/pages/wound_form/components/dropdown_menu.dart';
import 'package:laser_erapia/components/form_area.dart';
import 'package:laser_erapia/components/form_page_body.dart';
import 'package:laser_erapia/controllers/woundController.dart';
import 'package:laser_erapia/page_routes/app_pages.dart';
import 'package:laser_erapia/pages/wound_form/components/radio_buttons.dart';
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

  String predominantTissue = '';
  String exudateAmount = '';
  String exudateType = '';
  String woundBorders = '';
  final woundController = Get.find<WoundController>();
  final resultController = Get.find<ResultController>();
  bool showEtiology = false;
  bool showLocation = false;
  String etiology = '';
  String location = '';
  bool hasInfection = false;

  List<String> listOfEtiologies = [
    'Lesão por pressão',
    'Úlcera venosa',
    'Úlcera arterial',
    'Pé diabético',
    'Queimadura',
    'Ferida operatória',
    'Deiscência de FO',
    'Abscesso',
    'Escoriação',
    'Dermatite',
    'Ferida traumática',
    'Lesão por Fournier',
    'Radiodermite',
    'Fasciíte necrosante',
    'Lesão hansênica',
    'Erisipela',
    'Area doadora de enxerto',
    'Area receptora de enxerto',
  ];

  List<String> listOfLocations = [
    'Couro cabeludo',
    'Occiptal',
    'Face',
    'Orelha D',
    'Orelha E',
    'Pescoço',
    'Tórax',
    'Membro superior D',
    'Membro superior E',
    'Abdome',
    'Inguinal',
    'Períneo',
    'Membro inferior D',
    'Membro inferior E',
    'Pé D',
    'Pé E',
    'Dorso',
    'Escápula D',
    'Escápula E',
    'Sacral',
    'Ísquio D',
    'Ísquio E',
    'Trocanter D',
    'Trocanter E',
    'Calcanhar D',
    'Calcanhar E'
  ];

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    var appBarHeight =
        appbar.preferredSize.height + MediaQuery.of(context).padding.top;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height - appBarHeight;
    var paddingHeight = MediaQuery.of(context).padding.top;
    //e0eef9

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 240, 240),
      appBar: AppBar(
        backgroundColor: kRedColor,
        title: Text('Informações da lesão'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: FormPageBody(children: [
          // Text(
          //   'Avaliando a ferida',
          //   style: kFormTitleStyle,
          //   textAlign: TextAlign.start,
          // ),
          // const Padding(
          //   padding: EdgeInsets.only(left: 20),
          //   child: Text(
          //     'Preencha com as características examinadas na lesão do paciente',
          //     style: kFormSubtitleStyle,
          //   ),
          // ),
          FormArea(
            children: [
              choiceCard([
                formTitle(
                    text:
                        'A etiologia da lesão é oncológica ou sem diagnóstico?'),
                RadioButtons(
                  onPressNo: () {
                    setState(() {
                      etiology = "Válido";
                      showEtiology = true;
                    });
                  },
                  onPressYes: () {
                    setState(() {
                      etiology = "Etiologia inválida";
                      showEtiology = true;
                    });
                  },
                ),
                if (etiology != 'Etiologia inválida' && showEtiology == true)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      formTitle(text: 'Informe a etiologia'),
                      DropdownList(
                        listItems: listOfEtiologies,
                        fieldName: 'etiology',
                      ),
                    ],
                  ),
              ]),

              //
              //
              //

              choiceCard([
                formTitle(
                    text: 'A localização da lesão é em abdome gravídico?'),
                RadioButtons(
                  onPressNo: () {
                    setState(() {
                      location = "Válido";
                      showLocation = true;
                    });
                  },
                  onPressYes: () {
                    setState(() {
                      location = "Localização inválida";
                      showLocation = true;
                    });
                  },
                ),
                if (location != 'Localização inválida' && showLocation == true)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      formTitle(text: 'Localização anatômica'),
                      DropdownList(
                        listItems: listOfLocations,
                        fieldName: 'woundLocation',
                      ),
                    ],
                  ),
              ]),

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
                fieldName: 'predominantTissue',
              ),
              formTitle(text: 'Quantidade de exsudato'),
              DropdownList(
                listItems: const ['Nenhum', 'Pouco', 'Moderado', 'Acentuado'],
                fieldName: 'exudateAmount',
              ),

              formTitle(text: 'Tipo de exsudato'),
              DropdownList(
                listItems: const [
                  'Nenhum',
                  'Seroso ou serosanguinolento',
                  'Sanguinolento com sangramento',
                  'Seropurulento ou purulento',
                ],
                fieldName: 'exudateType',
              ),

              formTitle(text: 'Bordas da lesão'),
              DropdownList(
                listItems: const [
                  'Regular ou irregular, aderida',
                  'Descolada',
                  'Maceração',
                  'Hiperqueratose'
                ],
                fieldName: 'woundBorders',
              ),

              //OBS: essa é a última pergunta
              SizedBox(height: 10),
              choiceCard([
                formTitle(text: 'A lesão possui sinais de infecção?'),
                RadioButtons(
                  onPressNo: () {
                    setState(() {
                      hasInfection = false;
                    });
                  },
                  onPressYes: () {
                    setState(() {
                      //  location = "Localização inválida";
                      hasInfection = true;
                    });
                  },
                ),
              ]),
            ],
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: DefaultButton(
            onpress: () {
              resultController.observations.value = [];
              FocusScope.of(context).unfocus();

              //
              //
              if (woundController.exudateAmount.value != 'Nenhum' ||
                  woundController.exudateType.value ==
                      'Seropurulento ou purulento') {
                resultController.observations
                    .add('Aplicar Laserterapia após limpeza');
              }
              //
              //
              if (woundController.woundBorders.value ==
                      'Regular ou irregular, aderida' ||
                  woundController.woundBorders.value == 'Masceração') {
                resultController.observations.add('Laserterapia na borda');
              }
              //
              //
              if (woundController.woundBorders.value == 'Descolada') {
                resultController.observations
                    .add('Laserterapia em profundidade do deslocamento');
              }
              //
              //

              //
              //
              if (etiology == 'Etiologia inválida') {
                showAlert(
                    context: context,
                    title: 'Etiologia inválida!',
                    desc:
                        'O tratamento é contraindicado para este tipo de etiologia.');
              } else if (location == 'Localização inválida') {
                showAlert(
                    context: context,
                    title: 'Localização inválida!',
                    desc:
                        'O tratamento é contraindicado na área do abdome em mulheres gestantes.');
              } else if (woundController.predominantTissue.value ==
                  'Necrose preta, cinza ou esfacelos') {
                showAlert(
                    context: context,
                    title: 'Tratamento contraindicado!',
                    desc: 'Adiar Laserterapia até desbridamento.');
              } else if (woundController.exudateType.value ==
                  'Sanguinolento com sangramento') {
                showAlert(
                    context: context,
                    title: 'Tratamento contraindicado!',
                    desc: 'Adiar Laserterapia até melhora do sangramento.');
              } else if (woundController.woundBorders.value ==
                  'Hiperqueratose') {
                showAlert(
                    context: context,
                    title: 'Tratamento contraindicado!',
                    desc: 'Adiar Laserterapia na borda até desbaste.');
              }

              //
              //

              else if (_formKey.currentState!.validate()) {
                if (etiology.isEmpty ||
                    location.isEmpty ||
                    woundController.predominantTissue.value.isEmpty ||
                    woundController.exudateAmount.value.isEmpty ||
                    woundController.exudateType.value.isEmpty ||
                    woundController.woundBorders.value.isEmpty) {
                  showAlert(
                      context: context,
                      title: 'Preencha todos os campos!',
                      desc: '');
                } else {
                  woundController.woundWidth.value =
                      double.parse(widthController.text);
                  woundController.woundLength.value =
                      double.parse(lengthController.text);

                  woundController.calculateWoundArea();
                  resultController.determinateTreatment(hasInfection);
                  woundController.hasInfection.value = hasInfection;
                  Get.offNamed(PagesRoutes.resultPage);
                }
                //

              } else {}
            },
            buttonText: 'CONCLUIR',
            buttonColor: kDefaultButtonColor),
      ),
    );
  }
}
