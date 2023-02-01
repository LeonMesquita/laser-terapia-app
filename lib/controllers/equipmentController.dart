import 'package:get/state_manager.dart';
import 'package:laser_erapia/models/equipment_model.dart';

class EquipmentController extends GetxController {
  // RxDouble waveLength = 0.0.obs;
  RxDouble potency = 0.0.obs;
  RxDouble beamArea = 0.0.obs;
  RxDouble energyDensity = 0.0.obs;
  RxString equipmentName = ''.obs;
  RxInt seconds = 0.obs;

  void setData(Equipment equipment) {
    // waveLength.value = length;
    potency.value = equipment.potency;
    beamArea.value = equipment.beamArea;
    equipmentName.value = equipment.equipmentName;
    seconds.value = equipment.seconds;
    energyDensity.value = equipment.energyDensity;
  }

  void calculateDensity() {
    energyDensity.value = potency.value / beamArea.value;
  }
}
