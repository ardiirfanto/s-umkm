import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:s_umkm/constant/theme.dart';
import 'package:s_umkm/controllers/fetch_controller.dart';
import 'package:s_umkm/views/category_detail_page.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FetchController fetchController = Get.put(FetchController());
    fetchController.fetchCategory();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Daftar Kategori",
          style: textStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ),
      body: Obx(
        () => fetchController.listCategory.length > 0
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: fetchController.listCategory.length,
                      itemBuilder: (ctx, i) {
                        var val = fetchController.listCategory[i];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: GestureDetector(
                            onTap: () =>
                                Get.to(() => CategoryDetailPage(val: val)),
                            child: Card(
                              elevation: 2,
                              color: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  val.categoryName,
                                  style: textStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
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
