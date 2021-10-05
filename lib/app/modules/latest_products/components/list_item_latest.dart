import 'package:coffee_shop_website_design/app/shared/utils/functions/double_to_formatting_to_money_string.dart';
import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListItemLatest extends StatefulWidget {
  final String image;
  final String name;
  final double promotionalPrice;
  final double price;
  final double rating;
  final double ratingSize;
  final double nameSize;
  final double promotionalPriceSize;
  final double priceSize;

  const ListItemLatest({
    Key? key,
    required this.image,
    required this.name,
    required this.promotionalPrice,
    required this.price,
    required this.rating,
    required this.ratingSize,
    required this.nameSize,
    required this.priceSize,
    required this.promotionalPriceSize,
  }) : super(key: key);

  @override
  _ListItemLatestState createState() => _ListItemLatestState();
}

class _ListItemLatestState extends State<ListItemLatest> {
  final ConstStyle constStyle = ConstStyle();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent, border: Border.all(color: Colors.white)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 36,
                width: 36,
                child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.resolveWith(
                          (value) => EdgeInsets.zero),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (value) => Colors.transparent),
                      overlayColor: MaterialStateProperty.resolveWith(
                          (value) => constStyle.primaryColor),
                    ),
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: 36,
                  width: 36,
                  child: TextButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.resolveWith(
                            (value) => const Size(24, 24)),
                        padding: MaterialStateProperty.resolveWith(
                            (value) => EdgeInsets.zero),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (value) => Colors.transparent),
                        overlayColor: MaterialStateProperty.resolveWith(
                            (value) => constStyle.primaryColor),
                      ),
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 36,
                width: 36,
                child: TextButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.resolveWith(
                          (value) => const Size(24, 24)),
                      padding: MaterialStateProperty.resolveWith(
                          (value) => EdgeInsets.zero),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (value) => Colors.transparent),
                      overlayColor: MaterialStateProperty.resolveWith(
                          (value) => constStyle.primaryColor),
                    ),
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: const Icon(
                        Icons.visibility,
                        color: Colors.white,
                      ),
                    )),
              ),
            ],
          ),
          Image.asset(widget.image),
          Text(widget.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: widget.nameSize,
                  fontWeight: FontWeight.bold)),
          RatingBar(
            initialRating: widget.rating,
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
            itemSize: widget.ratingSize,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            unratedColor: Colors.white,
            onRatingUpdate: (rating) {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                doubleToFormattingToMoneyString(widget.promotionalPrice),
                style: TextStyle(
                    color: Colors.white, fontSize: widget.promotionalPriceSize),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                doubleToFormattingToMoneyString(widget.price),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.priceSize,
                    decoration: TextDecoration.lineThrough),
              )
            ],
          ),
        ],
      ),
    );
  }
}
