import 'package:coffee_shop_website_design/app/shared/utils/functions/double_to_formatting_to_money_string.dart';
import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter/material.dart';

class ListItemMenu extends StatefulWidget {
  final String image;
  final String name;
  final String buttonText;
  final double promotionalPrice;
  final double price;
  final double avatarRadius;
  final double nameSize;
  final double promotionalPriceSize;
  final double priceSize;
  final double buttonTextSize;
  final Function onPressed;
  final bool isDesktop;

  const ListItemMenu(
      {Key? key,
      required this.image,
      required this.name,
      required this.buttonText,
      required this.promotionalPrice,
      required this.price,
      required this.avatarRadius,
      required this.nameSize,
      required this.priceSize,
      required this.promotionalPriceSize,
      required this.buttonTextSize,
      required this.onPressed,
      required this.isDesktop})
      : super(key: key);

  @override
  _ListItemMenuState createState() => _ListItemMenuState();
}

class _ListItemMenuState extends State<ListItemMenu> {
  final ConstStyle constStyle = ConstStyle();
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        if (widget.isDesktop) {
          setState(() {
            isHover = true;
          });
        }
      },
      onExit: (event) {
        if (widget.isDesktop) {
          setState(() {
            isHover = false;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: isHover ? Colors.white.withAlpha(60) : Colors.transparent,
            border: Border.all(color: Colors.white)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(widget.image),
              radius: widget.avatarRadius,
            ),
            Text(
              widget.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: widget.nameSize,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  doubleToFormattingToMoneyString(widget.promotionalPrice),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: widget.promotionalPriceSize),
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
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: constStyle.primaryColor),
                onPressed: () {
                  widget.onPressed();
                },
                child: Text(
                  widget.buttonText,
                  style: TextStyle(
                      color: Colors.white, fontSize: widget.buttonTextSize),
                ))
          ],
        ),
      ),
    );
  }
}
