import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:s_umkm/constant/theme.dart';
import 'package:s_umkm/controllers/fetch_controller.dart';
import 'package:s_umkm/views/components/item_card.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FetchController fetchController = Get.put(FetchController());

    return Scaffold(
      appBar: _appBar(fetchController),
      body: Obx(
        () => fetchController.isLoading.value == true
            ? Center(
                child: SpinKitPulse(
                  color: primaryColor,
                ),
              )
            : fetchController.listSearch.length > 0
                ? listItem(fetchController)
                : Center(
                    child: Icon(
                      Typicons.search,
                      size: 120,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
      ),
    );
  }

  // Widget : List Item
  Widget listItem(FetchController fetchController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () => fetchController.listSearch.clear(),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.withOpacity(0.4)),
              child: Text(
                "Bersihkan",
                style: textStyle.copyWith(color: Colors.black54),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (ctx, i) => Divider(),
            shrinkWrap: true,
            itemCount: fetchController.listSearch.length,
            itemBuilder: (context, i) {
              var val = fetchController.listSearch[i];
              return ItemCard(val: val);
            },
          ),
        ),
      ],
    );
  }

  //Widget : Appbar
  Widget _appBar(FetchController fetchController) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.only(left: 2),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          controller: fetchController.textSearch,
          autofocus: false,
          textInputAction: TextInputAction.search,
          style: textStyle,
          onSubmitted: (_) => fetchController.onSearch(),
          cursorColor: primaryColor,
          decoration: InputDecoration(
            hintText: "Ketikan barang yang kamu cari..",
            hintStyle: textStyle.copyWith(
              color: Colors.black45,
              fontSize: 18,
            ),
            labelStyle: textStyle,
            border: InputBorder.none,
            prefixIcon: Icon(
              Typicons.search,
              size: 25,
              color: Colors.black54,
            ),
            suffixIcon: IconButton(
              onPressed: () => fetchController.textSearch.clear(),
              focusColor: Colors.grey,
              icon: Icon(
                Icons.close,
                color: Colors.black45,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
