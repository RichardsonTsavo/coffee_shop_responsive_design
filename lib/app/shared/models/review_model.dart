import 'dart:convert';

class ReviewModel {
  String? image;
  String? name;
  String? comment;
  double? rating;

  ReviewModel({
    this.image,
    this.name,
    this.rating,
    this.comment,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (image != null) {
      map["image"] = image;
    }
    if (name != null) {
      map["name"] = name;
    }
    if (comment != null) {
      map["comment"] = comment;
    }
    if (rating != null) {
      map["rating"] = rating;
    }
    return map;
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      image: map['image'],
      name: map['name'],
      comment: map['comment'],
      rating: map['rating'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) =>
      ReviewModel.fromMap(json.decode(source));
}
