import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_umkm/constant/theme.dart';
import 'package:s_umkm/models/category.dart';
import 'package:s_umkm/views/components/item_card.dart';

class CategoryDetailPage extends StatelessWidget {
  final Category val;

  CategoryDetailPage({this.val});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            color: primaryColor,
            onPressed: () => Get.back()),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Kategori : " + val.categoryName,
          style: textStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ),
      body: val.items.length > 0
          ? ListView.builder(
              itemCount: val.items.length,
              itemBuilder: (ctx, i) {
                return ItemCard(val: val.items[i]);
              },
            )
          : Center(
              child: Text(
                "Belum ada Barang",
                style: textStyle.copyWith(color: primaryColor, fontSize: 17),
              ),
            ),
    );
  }
}
