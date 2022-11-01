import 'package:get/state_manager.dart';

class EquipmentController extends GetxController {
  RxDouble waveLength = 0.0.obs;
  RxDouble potency = 0.0.obs;
  RxDouble beamArea = 0.0.obs;
  RxDouble energyDensity = 0.0.obs;

  void setData({required length, required pot, required area}) {
    waveLength.value = length;
    potency.value = pot;
    beamArea.value = area;
  }

  void calculateDensity() {
    energyDensity.value = potency.value / beamArea.value;
  }
}
