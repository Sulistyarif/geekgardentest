import 'package:flutter/material.dart';
import 'package:geekgarden_test/data/store_controller.dart';
import 'package:geekgarden_test/screens/main_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    storeController.loadOnlineProduct();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geekgarden Test',
      home: const MainPage(),
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
    );
  }
}
