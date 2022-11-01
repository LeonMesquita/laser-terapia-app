import 'package:get/state_manager.dart';

class ResultController extends GetxController {
  RxDouble waveLength = 0.0.obs;
  RxDouble potency = 0.0.obs;
  RxDouble beamArea = 0.0.obs;
  RxDouble energyDensity = 0.0.obs;
  RxString typeOfTreatment = ''.obs;
  RxString applicationMethod = ''.obs;

  RxString result = ''.obs;
  RxList observations = [].obs;

  // void setData({required length, required pot, required area}) {
  //   waveLength.value = length;
  //   potency.value = pot;
  //   beamArea.value = area;
  // }

  void determinateTreatment(hasInfection) {
    if (hasInfection == true) {
      typeOfTreatment.value = 'Terapia Fotodinâmica';
      result.value = 'Paciente indicado para Laserterapia Fotodinâmica';
      applicationMethod.value =
          'Aplicar azul de metileno 1% no leito, aguarde 5 minutos e proceda a irradiação com 90j/cm² por ponto a cada 5 a 7dias.';
    } else {
      typeOfTreatment.value = 'Terapia Fotobiomodulação';
      result.value = 'Paciente indicado para Laserterapia Fotobiomodulação';
      applicationMethod.value =
          'Iniciar o tratamento com dose de 4-5j/cm² por ponto a cada 48 a 72h. Não observando resultado satisfatório após algumas sessões, aumentar dose gradualmente até 10j/cm² por ponto a cada 48 a 72h.';
    }
  }

  void calcEnergyDensity(potency, beamArea) {
    energyDensity.value = potency / beamArea;
  }
}
