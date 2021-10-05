import 'package:coffee_shop_website_design/app/modules/core/core_store.dart';
import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MenuButtonAppBar extends StatefulWidget {
  final String nameButton;
  final int index;
  const MenuButtonAppBar(
      {Key? key, required this.nameButton, required this.index})
      : super(key: key);

  @override
  _MenuButtonAppBarState createState() => _MenuButtonAppBarState();
}

class _MenuButtonAppBarState extends State<MenuButtonAppBar> {
  final ConstStyle constStyle = ConstStyle();
  final CoreStore coreStore = Modular.get();
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) => TextButton(
        onPressed: () {
          coreStore.setScroll(index: widget.index);
        },
        child: MouseRegion(
          onHover: (event) {
            if(sizingInformation.isDesktop){
              setState(() {
                isHover = true;
              });
            }
          },
          onExit: (event) {
            if(sizingInformation.isDesktop){
              setState(() {
                isHover = false;
              });
            }
          },
          child: Text(
            widget.nameButton,
            style: TextStyle(
                decoration:
                isHover ? TextDecoration.underline : TextDecoration.none,
                color: isHover ? constStyle.primaryColor : Colors.white),
          ),
        )));
  }
}
