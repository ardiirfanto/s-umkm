import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:s_umkm/constant/string.dart';
import 'package:s_umkm/constant/theme.dart';
import 'package:s_umkm/controllers/fetch_controller.dart';
import 'package:s_umkm/views/umkm_detail_page.dart';
import 'package:url_launcher/url_launcher.dart';

class UmkmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FetchController fetchController = Get.put(FetchController());
    fetchController.fetchUmkm();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Daftar UMKM",
          style: textStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ),
      body: Obx(
        () => fetchController.listUmkm.length > 0
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: fetchController.listUmkm.length,
                      itemBuilder: (ctx, i) {
                        var val = fetchController.listUmkm[i];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: InkWell(
                              onTap: () =>
                                  Get.to(() => UmkmDetailPage(val: val)),
                              borderRadius: BorderRadius.circular(100),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: CachedNetworkImage(
                                      imageUrl: logoImgUrl + val.umkmLogo,
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        val.umkmName,
                                        style: textStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ),
                                      Text(
                                        val.phone,
                                        style: textStyle.copyWith(
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(0.8),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: Get.width * 25 / 100,
                    ),
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
}
