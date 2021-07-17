import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:s_umkm/constant/theme.dart';
import 'package:s_umkm/controllers/nav_controller.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.put(NavController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Obx(() => navController.page[navController.selectedPage.value]),
          Obx(
            () => Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  // border:
                  //     Border.all(color: Colors.grey.withOpacity(0.4), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset.zero,
                      blurRadius: 3,
                      spreadRadius: 0.3,
                    )
                  ],
                ),
                child: BottomNavigationBar(
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  onTap: (index) => navController.changePage(index),
                  currentIndex: navController.selectedPage.value,
                  selectedLabelStyle: textStyle,
                  unselectedLabelStyle: textStyle,
                  showUnselectedLabels: false,
                  iconSize: 20,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Typicons.home),
                      label: 'Beranda',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Typicons.search),
                      label: 'Cari',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Typicons.th_large),
                      label: 'Kategori',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Typicons.basket),
                      label: 'Umkm',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
