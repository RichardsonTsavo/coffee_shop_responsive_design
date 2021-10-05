import 'package:coffee_shop_website_design/app/shared/utils/functions/double_to_formatting_to_money_string.dart';
import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListItemPostsBlog extends StatelessWidget {
  final String image;
  final String title;
  final String userName;
  final DateTime date;
  final String comment;
  final String buttonText;
  final double buttonTextSize;
  final double imageHeight;
  final double imageWidth;
  final double titleSize;
  final double userNameAndDateSize;
  final double commentSize;

  const ListItemPostsBlog(
      {Key? key,
      required this.image,
      required this.title,
      required this.userName,
      required this.date,
      required this.comment,
      required this.buttonText,
      required this.buttonTextSize,
      required this.imageHeight,
      required this.imageWidth,
      required this.commentSize,
      required this.titleSize,
      required this.userNameAndDateSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ConstStyle constStyle = ConstStyle();
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent, border: Border.all(color: Colors.white)),
        child: Column(children: [
          SizedBox(
            height: imageHeight,
            width: imageWidth,
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: titleSize,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userAndDateFormater(),
                    style: TextStyle(
                        color: constStyle.primaryColor,
                        fontSize: userNameAndDateSize,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    comment,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: commentSize,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: constStyle.primaryColor),
                    onPressed: () {},
                    child: Text(
                      buttonText,
                      style: TextStyle(
                          color: Colors.white, fontSize: buttonTextSize),
                    ),
                  )
                ],
              ),
            ),
          )
        ]));
  }

  String userAndDateFormater() {
    return "$userName - ${date.day.toString().padLeft(2, "0")}/"
        "${date.month.toString().padLeft(2, "0")}/${date.year}";
  }
}
