import 'dart:async';

import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:s_umkm/views/components/navbar.dart';

class SplashController extends GetxController {
  Timer _timer;

  @override
  void onInit() {
    super.onInit();
    getAuthState();
  }

  @override
  void onClose() {
    super.onClose();
    _timer.cancel();
  }

  getAuthState() async {
    return _timer = Timer(Duration(seconds: 3), () {
      Get.offAll(() => NavigationPage());
    });
  }
}
