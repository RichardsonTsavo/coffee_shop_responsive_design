import 'package:coffee_shop_website_design/app/modules/core/core_store.dart';
import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuButtonsFooter extends StatefulWidget {
  final String buttonName;
  final int index;
  const MenuButtonsFooter(
      {Key? key, required this.buttonName, required this.index})
      : super(key: key);

  @override
  _MenuButtonsFooterState createState() => _MenuButtonsFooterState();
}

class _MenuButtonsFooterState extends State<MenuButtonsFooter> {
  ConstStyle constStyle = ConstStyle();
  CoreStore coreStore = Modular.get();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
          style: ButtonStyle(
            padding:
                MaterialStateProperty.resolveWith((value) => EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.resolveWith(
                (value) => Colors.transparent),
            overlayColor: MaterialStateProperty.resolveWith(
                (value) => constStyle.primaryColor),
          ),
          onPressed: () {
            coreStore.setScroll(index: widget.index);
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: constStyle.primaryColor)),
            child: Text(
              widget.buttonName,
              style: const TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
