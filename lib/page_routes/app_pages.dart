import 'package:get/route_manager.dart';
import 'package:laser_erapia/pages/equipment_form/equipment_form.dart';
import 'package:laser_erapia/pages/init_page/init_page.dart';
import 'package:laser_erapia/pages/result_page/result_page.dart';
import 'package:laser_erapia/pages/wound_form/wound_form.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.initPage,
      page: () => InitPage(),
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
  ];
}

abstract class PagesRoutes {
  static const String initPage = '/init-page';
  static const String equipmentForm = '/equipment-form';
  static const String woundForm = '/wound-form';
  static const String resultPage = '/result';
}
