import 'package:coffee_shop_website_design/app/shared/utils/functions/double_to_formatting_to_money_string.dart';
import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListItemReview extends StatelessWidget {
  final String image;
  final String name;
  final String comment;
  final double rating;
  final double avatarRadius;
  final double ratingSize;
  final double accentSize;
  final double nameSize;
  final double commentSize;

  const ListItemReview(
      {Key? key,
      required this.accentSize,
      required this.image,
      required this.name,
      required this.avatarRadius,
      required this.rating,
      required this.ratingSize,
      required this.comment,
      required this.nameSize,
      required this.commentSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConstStyle constStyle = ConstStyle();
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(constStyle.quiteImg),
          Text(comment,
              style: TextStyle(
                color: Colors.white,
                fontSize: commentSize,
                fontWeight: FontWeight.bold,
              )),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(image),
            radius: avatarRadius,
          ),
          Text(name,
              style: TextStyle(
                color: Colors.white,
                fontSize: nameSize,
                fontWeight: FontWeight.bold,
              )),
          RatingBar(
            initialRating: rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            ignoreGestures: true,
            itemCount: 5,
            ratingWidget: RatingWidget(
              full: const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              half: const Icon(
                Icons.star_half,
                color: Colors.amber,
              ),
              empty: const Icon(
                Icons.star_border,
                color: Colors.amber,
              ),
            ),
            itemSize: ratingSize,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            unratedColor: Colors.white,
            onRatingUpdate: (rating) {},
          ),
        ],
      ),
    );
  }
}
