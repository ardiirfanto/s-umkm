import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:s_umkm/constant/string.dart';
import 'package:s_umkm/models/category.dart';
import 'package:s_umkm/models/item.dart';
import 'package:s_umkm/models/umkm.dart';

class Services {
  Dio dio = new Dio();

  Future fetchItems() async {
    try {
      final res = await dio.get(apiUrl + 'item');

      if (res.statusCode == 200) {
        final fromJson = json.decode(res.data);
        final toJson = json.encode(fromJson['res']);
        List<Item> data = listItemFromJson(toJson);
        return data;
      } else {
        return 1;
      }
    } on DioError catch (e) {
      print(e);
      return 0;
    }
  }

  Future fetchCategories() async {
    try {
      final res = await dio.get(apiUrl + 'category');

      if (res.statusCode == 200) {
        final fromJson = json.decode(res.data);
        final toJson = json.encode(fromJson['res']);
        List<Category> data = listCategoryFromJson(toJson);
        return data;
      } else {
        return 1;
      }
    } on DioError catch (e) {
      print(e);
      return 0;
    }
  }

  Future fetchUmkm() async {
    try {
      final res = await dio.get(apiUrl + 'umkm');

      if (res.statusCode == 200) {
        final fromJson = json.decode(res.data);
        final toJson = json.encode(fromJson['res']);
        List<Umkm> data = listUmkmFromJson(toJson);
        return data;
      } else {
        return 1;
      }
    } on DioError catch (e) {
      print(e);
      return 0;
    }
  }

  Future search(String search) async {
    try {
      FormData formData = new FormData.fromMap({
        "content": search,
      });

      final res = await dio.post(
        apiUrl + 'search',
        data: formData,
      );

      if (res.statusCode == 200) {
        final fromJson = json.decode(res.data);
        final toJson = json.encode(fromJson['res']);
        List<Item> data = listItemFromJson(toJson);
        if (data.length > 0) {
          return data;
        } else {
          return 2;
        }
      } else {
        return 1;
      }
    } on DioError catch (e) {
      print(e);
      return 0;
    }
  }
}
