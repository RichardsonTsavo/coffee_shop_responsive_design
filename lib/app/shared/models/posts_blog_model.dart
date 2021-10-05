import 'dart:convert';

class PostsBlog {
  String? image;
  String? title;
  String? userName;
  DateTime? date;
  String? comment;

  PostsBlog({
    this.image,
    this.userName,
    this.comment,
    this.date,
    this.title
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (image != null) {
      map["image"] = image;
    }
    if (userName != null) {
      map["userName"] = userName;
    }
    if (comment != null) {
      map["comment"] = comment;
    }
    if (date != null) {
      map["date"] = date;
    }
    if (title != null) {
      map["title"] = title;
    }

    return map;
  }

  factory PostsBlog.fromMap(Map<String, dynamic> map) {
    return PostsBlog(
      image: map['image'],
      userName: map['userName'],
      comment: map['comment'],
      date: map['date'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostsBlog.fromJson(String source) =>
      PostsBlog.fromMap(json.decode(source));
}
