// To parse this JSON data, do
//
//     final getPostapi = getPostapiFromJson(jsonString);

import 'dart:convert';

GetPostapi getPostapiFromJson(String str) =>
    GetPostapi.fromJson(json.decode(str));

String getPostapiToJson(GetPostapi data) => json.encode(data.toJson());

class GetPostapi {
  GetPostapi({
    this.data,
    this.brandProducts,
  });

  List<Datum>? data;
  List<BrandProduct>? brandProducts;

  factory GetPostapi.fromJson(Map<String, dynamic> json) => GetPostapi(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        brandProducts: json["brand_products"] == null
            ? null
            : List<BrandProduct>.from(
                json["brand_products"].map((x) => BrandProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "brand_products": brandProducts == null
            ? null
            : List<dynamic>.from(brandProducts!.map((x) => x.toJson())),
      };
}

class BrandProduct {
  BrandProduct({
    this.productId,
    this.productName,
    this.price,
    this.description,
    this.productImage,
  });

  int? productId;
  String? productName;
  double? price;
  String? description;
  String? productImage;

  factory BrandProduct.fromJson(Map<String, dynamic> json) => BrandProduct(
        productId: json["product_id"] == null ? null : json["product_id"],
        productName: json["product_name"] == null ? null : json["product_name"],
        price: json["price"] == null ? null : json["price"],
        description: json["description"] == null ? null : json["description"],
        productImage:
            json["product_image"] == null ? null : json["product_image"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId == null ? null : productId,
        "product_name": productName == null ? null : productName,
        "price": price == null ? null : price,
        "description": description == null ? null : description,
        "product_image": productImage == null ? null : productImage,
      };
}

class Datum {
  Datum({
    this.brandId,
    this.brandName,
    this.brandImage,
  });

  int? brandId;
  String? brandName;
  String? brandImage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        brandId: json["brand_id"] == null ? null : json["brand_id"],
        brandName: json["brand_name"] == null ? null : json["brand_name"],
        brandImage: json["brand_image"] == null ? null : json["brand_image"],
      );

  Map<String, dynamic> toJson() => {
        "brand_id": brandId == null ? null : brandId,
        "brand_name": brandName == null ? null : brandName,
        "brand_image": brandImage == null ? null : brandImage,
      };
}
