import 'dart:convert';

import 'item.dart';

Umkm umkmFromJson(String str) => Umkm.fromJson(json.decode(str));

List<Umkm> listUmkmFromJson(String str) =>
    List<Umkm>.from(json.decode(str).map((x) => Umkm.fromJson(x)));

String umkmToJson(List<Umkm> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Umkm {
  Umkm({
    this.umkmId,
    this.userId,
    this.umkmName,
    this.umkmAddress,
    this.umkmLogo,
    this.owner,
    this.phone,
    this.username,
    this.password,
    this.role,
    this.lat,
    this.lng,
    this.items,
  });

  String umkmId;
  String userId;
  String umkmName;
  String umkmAddress;
  String umkmLogo;
  String owner;
  String phone;
  String username;
  String password;
  String role;
  String lat;
  String lng;
  List<Item> items;

  factory Umkm.fromJson(Map<String, dynamic> json) => Umkm(
        umkmId: json["umkm_id"],
        userId: json["user_id"],
        umkmName: json["umkm_name"],
        umkmAddress: json["umkm_address"],
        umkmLogo: json["umkm_logo"],
        owner: json["owner"],
        phone: json["phone"],
        username: json["username"],
        password: json["password"],
        role: json["role"],
        lat: json["lat"],
        lng: json["lng"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "umkm_id": umkmId,
        "user_id": userId,
        "umkm_name": umkmName,
        "umkm_address": umkmAddress,
        "umkm_logo": umkmLogo,
        "owner": owner,
        "phone": phone,
        "username": username,
        "password": password,
        "role": role,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}
