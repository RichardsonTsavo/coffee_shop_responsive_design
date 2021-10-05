import 'package:coffee_shop_website_design/app/modules/core/core_store.dart';
import 'package:coffee_shop_website_design/app/shared/custom_text_form_field/custom_text_form_field.dart';
import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:coffee_shop_website_design/app/modules/app_bar/app_bar_store.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppBarPage extends StatefulWidget {
  final String title;
  const AppBarPage({Key? key, this.title = 'AppBarPage'}) : super(key: key);
  @override
  AppBarPageState createState() => AppBarPageState();
}

class AppBarPageState extends State<AppBarPage> {
  final AppBarStore store = Modular.get();
  final CoreStore coreStore = Modular.get();
  final ConstStyle constStyle = ConstStyle();

  @override
  void initState() {
    super.initState();
    store.setMenuNames();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => LayoutBuilder(
            builder: (context, constraints) => Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizingInformation.isDesktop ? 50 : 15),
                  child: sizingInformation.isDesktop
                      ? AppBar(
                          backgroundColor: Colors.black,
                          elevation: 0,
                          toolbarHeight: 80,
                          leadingWidth: 70,
                          leading: TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.resolveWith(
                                  (value) => EdgeInsets.zero),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                      (value) => Colors.transparent),
                              overlayColor: MaterialStateProperty.resolveWith(
                                  (value) => Colors.transparent),
                              foregroundColor:
                                  MaterialStateProperty.resolveWith(
                                      (value) => Colors.transparent),
                            ),
                            onPressed: () {},
                            child: Image.asset(constStyle.logo),
                          ),
                          centerTitle: true,
                          title: SizedBox(
                            width: constraints.maxWidth / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: store.menuButtons,
                            ),
                          ),
                          actions: [
                            PopupMenuButton(
                              tooltip: store.textInfo("popupFlag"),
                              icon: store.iconFlag(),
                              offset: const Offset(0, 80),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  onTap: () {
                                    coreStore.scrollController.cancelAllHighlights();
                                    store.setLanguage(0);
                                  },
                                  child: const Text("Portugues"),
                                ),
                                PopupMenuItem(
                                  onTap: () {
                                    coreStore.scrollController.cancelAllHighlights();
                                    store.setLanguage(1);
                                  },
                                  child: const Text("Inglês"),
                                ),
                              ],
                            ),
                            MouseRegion(
                              onHover: (event) {
                                store.setMenuButtonsOnHover(
                                    index: 0, value: true);
                              },
                              onExit: (event) {
                                store.setMenuButtonsOnHover(
                                    index: 0, value: false);
                              },
                              child: PopupMenuButton(
                                color: Colors.transparent,
                                tooltip: store.textInfo("popupSearch"),
                                icon: Observer(
                                  builder: (context) => Icon(Icons.search,
                                      color: store.menuButtonsOnHover[0]
                                          ? constStyle.primaryColor
                                          : Colors.white),
                                ),
                                offset: const Offset(0, 80),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: SizedBox(
                                      width: sizingInformation.isMobile
                                          ? constraints.maxWidth / 1.5
                                          : constraints.maxWidth / 4,
                                      child: CustomTextFormField(
                                          fillColor: Colors.white,
                                          cursorColor: Colors.black,
                                          textColor: Colors.black,
                                          hint: store.textInfo("hintSearch"),
                                          suffixIcon: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.search,
                                                color: Colors.black),
                                          ),
                                          isHint: true,
                                          obscureText: false,
                                          needTheSpace: false),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MouseRegion(
                              onHover: (event) {
                                store.setMenuButtonsOnHover(
                                    index: 1, value: true);
                              },
                              onExit: (event) {
                                store.setMenuButtonsOnHover(
                                    index: 1, value: false);
                              },
                              child: Observer(
                                builder: (context) => PopupMenuButton(
                                  tooltip: store.textInfo("popupCart"),
                                  icon: Icon(Icons.shopping_cart,
                                      color: store.menuButtonsOnHover[1]
                                          ? constStyle.primaryColor
                                          : Colors.white),
                                  offset: const Offset(0, 80),
                                  itemBuilder: (context) => store.listCart,
                                ),
                              ),
                            ),
                          ],
                        )
                      : AppBar(
                          backgroundColor: Colors.black,
                          elevation: 0,
                          toolbarHeight: 80,
                          leadingWidth: 70,
                          leading: TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.resolveWith(
                                  (value) => EdgeInsets.zero),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                      (value) => Colors.transparent),
                              overlayColor: MaterialStateProperty.resolveWith(
                                  (value) => Colors.transparent),
                              foregroundColor:
                                  MaterialStateProperty.resolveWith(
                                      (value) => Colors.transparent),
                            ),
                            onPressed: () {},
                            child: Image.asset(constStyle.logo),
                          ),
                          centerTitle: true,
                          actions: [
                            PopupMenuButton(
                              tooltip: store.textInfo("popupFlag"),
                              icon: store.iconFlag(),
                              offset: const Offset(0, 80),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  onTap: () {
                                    store.setLanguage(0);
                                  },
                                  child: const Text("Portugues"),
                                ),
                                PopupMenuItem(
                                  onTap: () {
                                    store.setLanguage(1);
                                  },
                                  child: const Text("Inglês"),
                                ),
                              ],
                            ),
                            PopupMenuButton(
                              color: Colors.transparent,
                              tooltip: store.textInfo("popupSearch"),
                              icon: Observer(
                                builder: (context) => Icon(Icons.search,
                                    color: store.menuButtonsOnHover[0]
                                        ? constStyle.primaryColor
                                        : Colors.white),
                              ),
                              offset: const Offset(0, 80),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: SizedBox(
                                    width: constraints.maxWidth,
                                    child: CustomTextFormField(
                                        fillColor: Colors.white,
                                        cursorColor: Colors.black,
                                        textColor: Colors.black,
                                        hint: store.textInfo("hintSearch"),
                                        suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.search,
                                              color: Colors.black),
                                        ),
                                        isHint: true,
                                        obscureText: false,
                                        needTheSpace: false),
                                  ),
                                ),
                              ],
                            ),
                            Observer(
                              builder: (context) => PopupMenuButton(
                                tooltip: store.textInfo("popupCart"),
                                icon: Icon(Icons.shopping_cart,
                                    color: store.menuButtonsOnHover[1]
                                        ? constStyle.primaryColor
                                        : Colors.white),
                                offset: const Offset(0, 80),
                                itemBuilder: (context) => store.listCart,
                              ),
                            ),
                            Observer(
                              builder: (context) => PopupMenuButton(
                                tooltip: store.textInfo("popupMenu"),
                                icon: Icon(Icons.menu,
                                    color: store.menuButtonsOnHover[2]
                                        ? constStyle.primaryColor
                                        : Colors.white),
                                offset: const Offset(0, 80),
                                itemBuilder: (context) => store.menuButtons
                                    .map((element) => PopupMenuItem(
                                    onTap: () {
                                      coreStore.setScroll(
                                          index: element.index);
                                    },
                                    child: Text(element.nameButton)))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                )),
      ),
    );
  }
}
