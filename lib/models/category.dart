import 'dart:convert';

import 'item.dart';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

List<Category> listCategoryFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    this.categoryId,
    this.categoryName,
    this.items,
  });

  String categoryId;
  String categoryName;
  List<Item> items;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}
