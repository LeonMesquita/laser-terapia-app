import 'package:get/state_manager.dart';

class WoundController extends GetxController {
  RxString etiology = ''.obs;
  RxString woundLocation = ''.obs;
  RxDouble woundWidth = 0.0.obs;
  RxDouble woundLength = 0.0.obs;
  RxDouble woundArea = 0.0.obs;
  RxString predominantTissue = ''.obs;
  RxString exudateAmount = ''.obs;
  RxString exudateType = ''.obs;
  RxString woundBorders = ''.obs;
  RxBool hasInfection = false.obs;

  void setData({
    required etiol,
    required location,
    required width,
    required length,
    required predominant,
    required amount,
    required result,
    required borders,
    required infection,
  }) {
    etiology.value = etiol;
    woundLocation.value = location;
    woundWidth.value = width;
    woundLength.value = length;
    predominantTissue.value = predominant;
    exudateAmount.value = amount;
    exudateType.value = result;
    woundBorders.value = borders;
    hasInfection.value = infection;
  }

  void calculateWoundArea() {
    woundArea.value = woundLength.value * woundWidth.value;
  }
}
