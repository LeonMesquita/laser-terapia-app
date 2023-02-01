import 'package:flutter/material.dart';
import 'package:laser_erapia/utils/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Future<void> showAlert(
    {required BuildContext context,
    required title,
    required desc,
    VoidCallback? onpress,
    VoidCallback? secondButtonOnpress,
    bool? secondButton = false,
    String? buttonText,
    String? secondButtonText}) {
  return Alert(
      context: context,
      type: AlertType.error,
      title: title,
      desc: desc,
      buttons: [
        dialogButton(
          text: buttonText ?? 'Entendi',
          onpress: onpress ??
              () {
                Navigator.of(context).pop();
              },
        ),
        if (secondButton == true)
          dialogButton(
            text: buttonText ?? 'Entendi',
            onpress: secondButtonOnpress ??
                () {
                  Navigator.of(context).pop();
                },
          ),
      ]).show();
}

DialogButton dialogButton({VoidCallback? onpress, required text}) {
  return DialogButton(
    color: kRedColor,
    onPressed: onpress,
    child: Text(
      text,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );
}

// Alert(
//           context: context,
//           type: AlertType.success,
//           title: 'Fim do Teste!',
//           desc: 'Calcular o resultado agora?',
//           buttons: [
//             DialogButton(
//               color: kCorDoTema,
//               //
//               // Opção que reseta o teste
//               child: Text(
//                 "Repetir",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),
//               ),
//               onPressed: () {

//               },
//               width: 120,
//             ),
//             //
//             // Ao clicar nessa opção, é iniciado a série de
//             // perguntas direcionadas ao examinador
//             DialogButton(
//              // color: kCorDoTema,
//               child: Text(
//                 "Confirmar",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PaginaDeResultados(),
//                   ),
//                 );
//                 setState(() {
//                   marcadorDePontos = calcResult(newPatient: novoPaciente);
//                   //calcularResultado();
//                 });
//               },
//               width: 120,
//             )
//           ],
//         ).show();
