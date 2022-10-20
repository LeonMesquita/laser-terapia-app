import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laser_erapia/components/default_button.dart';
import 'package:laser_erapia/components/know_more_button.dart';
import 'package:laser_erapia/utils/constants.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    var appBarHeight =
        appbar.preferredSize.height + MediaQuery.of(context).padding.top;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height - appBarHeight;
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(kInitBackgroundImage), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                const Text(
                  'Laser terapia',
                  style: kTitleStyle,
                  textAlign: TextAlign.start,
                ),
                const Text(
                  'Tratamento de feridas',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 50),
                Text(
                  'O laser de baixa intensidade apresenta-se como uma opção adjuvant para auxiliar no tratamento de feridas por acelerar o processo de reparação tecidual.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Center(
                    child: KnowMoreButton(
                  onpress: () {},
                )),

                //
                Expanded(child: SizedBox()),
                Center(
                  child: DefaultButton(
                      onpress: () {},
                      buttonText: 'INICIAR ATENDIMENTO',
                      buttonColor: kDefaultButtonColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//Color(0xFFB8E5BF)