import 'package:flutter/material.dart';
import 'package:laser_erapia/controllers/equipmentController.dart';
import 'package:laser_erapia/controllers/woundController.dart';
import 'package:laser_erapia/page_routes/app_pages.dart';
import 'package:laser_erapia/pages/init_page/init_page.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

void main() {
  Get.put(EquipmentController());
  Get.put(WoundController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InitPage(),
      initialRoute: PagesRoutes.initPage,
      getPages: AppPages.pages,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// Color(0xFF1F4C26)