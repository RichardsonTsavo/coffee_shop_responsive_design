import 'dart:convert';

class ProductModel {
  int? id;
  String? image;
  String? name;
  double? promotionalPrice;
  double? price;
  double? rating;
  int? quantity = 1;

  ProductModel({
    this.image,
    this.name,
    this.rating,
    this.promotionalPrice,
    this.price,
    this.id,
    this.quantity
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (image != null) {
      map["image"] = image;
    }
    if (name != null) {
      map["name"] = name;
    }
    if (promotionalPrice != null) {
      map["promotionalPrice"] = promotionalPrice;
    }
    if (price != null) {
      map["price"] = price;
    }
    if (rating != null) {
      map["rating"] = rating;
    }
    if (quantity != null) {
      map["quantity"] = quantity;
    }
    return map;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      image: map['image'],
      name: map['name'],
      price: map['price'],
      promotionalPrice: map['promotionalPrice'],
      rating: map['rating'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
