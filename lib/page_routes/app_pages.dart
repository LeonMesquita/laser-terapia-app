import 'package:get/route_manager.dart';
import 'package:laser_erapia/pages/equipment_form/choose_equipment.dart';
import 'package:laser_erapia/pages/equipment_form/equipment_form.dart';
import 'package:laser_erapia/pages/init_page/init_page.dart';
import 'package:laser_erapia/pages/result_page/result_page.dart';
import 'package:laser_erapia/pages/result_page/resume_page.dart';
import 'package:laser_erapia/pages/wound_form/wound_form.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.initPage,
      page: () => InitPage(),
    ),
    GetPage(
      name: PagesRoutes.chooseEquipment,
      page: () => ChooseEquipment(),
    ),
    GetPage(
      name: PagesRoutes.equipmentForm,
      page: () => EquipmentForm(),
    ),
    GetPage(
      name: PagesRoutes.woundForm,
      page: () => WoundForm(),
    ),
    GetPage(
      name: PagesRoutes.resultPage,
      page: () => ResultPage(),
    ),
    GetPage(
      name: PagesRoutes.resumeInformations,
      page: () => ResumeInformations(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String initPage = '/init-page';
  static const String equipmentForm = '/equipment-form';
  static const String chooseEquipment = '/equipment';
  static const String woundForm = '/wound-form';
  static const String resultPage = '/result';
  static const String resumeInformations = '/resume';
}
