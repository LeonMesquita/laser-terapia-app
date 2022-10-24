import 'package:get/state_manager.dart';

class WoundController extends GetxController {
  RxString etiology = ''.obs;
  RxString woundLocation = ''.obs;
  RxDouble woundWidth = 0.0.obs;
  RxDouble woundLength = 0.0.obs;
  RxString predominantTissue = ''.obs;
  RxString exudateAmount = ''.obs;
  RxString resultType = ''.obs;
  RxString woundBorders = ''.obs;
  RxString signsOfInfection = ''.obs;

  void setData({
    required etiol,
    required location,
    required width,
    required length,
    required predominant,
    required amount,
    required result,
    required borders,
    required signs,
  }) {
    etiology.value = etiol;
    woundLocation.value = location;
    woundWidth.value = width;
    woundLength.value = length;
    predominantTissue.value = predominant;
    exudateAmount.value = amount;
    resultType.value = result;
    woundBorders.value = borders;
    signsOfInfection.value = signs;
  }
}
