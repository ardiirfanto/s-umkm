import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_umkm/views/splash_page.dart';
import 'constant/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "siUMKM",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
      ),
      home: SplashPage(),
    );
  }
}
