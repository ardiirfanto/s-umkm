import 'package:get/get.dart';
import 'package:s_umkm/views/category_page.dart';
import 'package:s_umkm/views/home_page.dart';
import 'package:s_umkm/views/search_page.dart';
import 'package:s_umkm/views/umkm_page.dart';

class NavController extends GetxController {
  // List Page
  List page = [
    HomePage(),
    SearchPage(),
    CategoryPage(),
    UmkmPage(),
  ];

  Rx<int> selectedPage = 0.obs;

  changePage(int index) => this.selectedPage.value = index;
}
