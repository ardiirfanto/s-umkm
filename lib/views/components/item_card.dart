import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_umkm/constant/string.dart';
import 'package:s_umkm/constant/theme.dart';
import 'package:s_umkm/models/item.dart';
import 'package:s_umkm/views/item_detail_page.dart';

class ItemCard extends StatelessWidget {
  final Item val;

  ItemCard({this.val});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: InkWell(
          onTap: () => Get.to(() => ItemDetailPage(val: val)),
          borderRadius: BorderRadius.circular(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                child: Hero(
                  tag: val.itemId,
                  child: CachedNetworkImage(
                    imageUrl: itemImgUrl + val.itemImg,
                    height: 220,
                    width: Get.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      val.itemName,
                      style: textStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
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
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CachedNetworkImage(
                                imageUrl: logoImgUrl + val.umkmLogo,
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(val.umkmName, style: textStyle)
                          ],
                        )
                      ],
                    ),
                    Divider(),
                    Text(
                      val.itemDesc,
                      style: textStyle,
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
