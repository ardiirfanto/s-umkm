import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_umkm/models/category.dart';
import 'package:s_umkm/models/item.dart';
import 'package:s_umkm/models/umkm.dart';
import 'package:s_umkm/services/services.dart';

class FetchController extends GetxController {
  Services api = new Services();

  RxList<Item> listItem = RxList<Item>();
  RxList<Item> listSearch = RxList<Item>();
  RxList<Category> listCategory = RxList<Category>();
  RxList<Umkm> listUmkm = RxList<Umkm>();
  TextEditingController textSearch = new TextEditingController();

  RxBool isLoading = false.obs;

  fetchItem() {
    api.fetchItems().then((value) => this.listItem.assignAll(value));
  }

  fetchCategory() {
    api.fetchCategories().then((value) => this.listCategory.assignAll(value));
  }

  fetchUmkm() {
    api.fetchUmkm().then((value) => this.listUmkm.assignAll(value));
  }

  onSearch() {
    if (textSearch.text == '' || textSearch.text == null) {
      snackbar('Peringatan', 'Kolom Search tidak boleh kosong', Colors.orange);
    } else {
      this.isLoading.value = true;
      this.listSearch.clear();
      api.search(textSearch.text).then((value) {
        this.isLoading.value = false;
        if (value == 1 || value == 0) {
          snackbar('Gagal', 'Gagal Mendapatkan Data', Colors.red);
        } else {
          if (value == 2) {
            snackbar('Maaf', 'Apa yang kamu cari tidak ada', Colors.red);
          } else {
            this.listSearch.assignAll(value);
          }
        }
      });
    }
  }

  snackbar(title, msg, Color color) {
    return Get.snackbar(title, msg,
        backgroundColor: color, colorText: Colors.white);
  }
}
