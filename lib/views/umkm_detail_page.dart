import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:s_umkm/constant/string.dart';
import 'package:s_umkm/constant/theme.dart';
import 'package:s_umkm/models/umkm.dart';
import 'package:s_umkm/views/components/item_card.dart';
import 'package:url_launcher/url_launcher.dart';

class UmkmDetailPage extends StatelessWidget {
  final Umkm val;

  UmkmDetailPage({this.val});
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
          val.umkmName,
          style: textStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ),
      body: Container(
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl: logoImgUrl + val.umkmLogo,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Owner : " + val.owner,
                style: textStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              ElevatedButton(
                onPressed: () => launch(
                    " https://api.whatsapp.com/send?phone=${val.phone}&text=Hallo ${val.umkmName}, Bolehkah Saya Bertanya Sesuatu tentang UMKM ini?"),
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FontAwesome5.whatsapp,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      val.phone,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                val.umkmAddress,
                style: textStyle,
              ),
              Divider(),
              val.items.length > 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: val.items.length,
                      itemBuilder: (ctx, i) {
                        return ItemCard(
                          val: val.items[i],
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        "UMKM ini belum mempunyai produk",
                        style: textStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
