import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:s_umkm/constant/theme.dart';
import 'package:s_umkm/controllers/fetch_controller.dart';
import 'package:s_umkm/views/components/item_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FetchController fetchController = Get.put(FetchController());

    fetchController.fetchItem();

    return Scaffold(
      appBar: appBar(),
      body: Obx(
        () => fetchController.listItem.length > 0
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: fetchController.listItem.length,
                      itemBuilder: (ctx, i) {
                        var val = fetchController.listItem[i];
                        return ItemCard(val: val);
                      },
                    ),
                    SizedBox(
                      height: Get.width * 25 / 100,
                    )
                  ],
                ),
              )
            : Center(
                child: SpinKitPulse(
                  color: primaryColor,
                ),
              ),
      ),
    );
  }

  // Widget : AppBar
  Widget appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/img/icon.png",
            width: 32,
            height: 32,
          ),
          SizedBox(width: 5),
          Text(
            "si",
            style: textStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              fontSize: 23,
            ),
          ),
          Text(
            "UMKM",
            style: textStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: primaryColor,
              fontSize: 23,
            ),
          )
        ],
      ),
    );
  }
}
