import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:s_umkm/constant/string.dart';
import 'package:s_umkm/constant/theme.dart';
import 'package:s_umkm/models/item.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemDetailPage extends StatelessWidget {
  final Item val;

  ItemDetailPage({this.val});

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
        title: Text(
          val.itemName,
          style: textStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          itemDetail(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              child: InkWell(
                onTap: () => launch(
                    " https://api.whatsapp.com/send?phone=${val.phone}&text=Hallo ${val.umkmName}, Saya Menginginkan Barang ini. apakah tersedia?"),
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesome5.whatsapp,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Hubungi Penjual",
                        style: textStyle.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widget: Item Detail
  Widget itemDetail() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                tag: val.itemId,
                child: CachedNetworkImage(
                  imageUrl: itemImgUrl + val.itemImg,
                  height: Get.height * 40 / 100,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              val.itemName,
              style: textStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    val.categoryName,
                    style: textStyle.copyWith(color: Colors.white),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(5),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            imageUrl: logoImgUrl + val.umkmLogo,
                            width: 20,
                            height: 20,
                          ),
                        ),
                        Text(
                          val.umkmName,
                          style: textStyle.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Divider(),
            Text(
              val.itemDesc,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
