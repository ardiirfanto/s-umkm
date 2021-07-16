import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:s_umkm/constant/string.dart';
import 'package:s_umkm/constant/theme.dart';
import 'package:s_umkm/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "${imgPath}icon.png",
              height: 120,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 20,
            ),
            SpinKitThreeBounce(
              size: 25,
              color: primaryColor,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
