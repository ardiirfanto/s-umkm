import 'dart:convert';

List<Item> listItemFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  Item({
    this.itemId,
    this.umkmId,
    this.categoryId,
    this.itemName,
    this.itemDesc,
    this.itemImg,
    this.categoryName,
    this.userId,
    this.umkmName,
    this.umkmAddress,
    this.umkmLogo,
    this.owner,
    this.phone,
  });

  String itemId;
  String umkmId;
  String categoryId;
  String itemName;
  String itemDesc;
  String itemImg;
  String categoryName;
  String userId;
  String umkmName;
  String umkmAddress;
  String umkmLogo;
  String owner;
  String phone;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemId: json["item_id"],
        umkmId: json["umkm_id"],
        categoryId: json["category_id"],
        itemName: json["item_name"],
        itemDesc: json["item_desc"],
        itemImg: json["item_img"],
        categoryName: json["category_name"],
        userId: json["user_id"],
        umkmName: json["umkm_name"],
        umkmAddress: json["umkm_address"],
        umkmLogo: json["umkm_logo"],
        owner: json["owner"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "umkm_id": umkmId,
        "category_id": categoryId,
        "item_name": itemName,
        "item_desc": itemDesc,
        "item_img": itemImg,
        "category_name": categoryName,
        "user_id": userId,
        "umkm_name": umkmName,
        "umkm_address": umkmAddress,
        "umkm_logo": umkmLogo,
        "owner": owner,
        "phone": phone,
      };
}
