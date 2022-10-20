import 'package:get/route_manager.dart';
import 'package:laser_erapia/pages/init_page/init_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.initPage,
      page: () => InitPage(),
    )
  ];
}

abstract class PagesRoutes {
  static const String initPage = '/init-page';
}
