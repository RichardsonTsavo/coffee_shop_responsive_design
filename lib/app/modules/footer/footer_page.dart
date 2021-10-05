import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:coffee_shop_website_design/app/modules/footer/footer_store.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FooterPage extends StatefulWidget {
  final String title;
  const FooterPage({Key? key, this.title = 'FooterPage'}) : super(key: key);
  @override
  FooterPageState createState() => FooterPageState();
}

class FooterPageState extends State<FooterPage> {
  final FooterStore store = Modular.get();
  final ConstStyle constStyle = ConstStyle();

  @override
  void initState() {
    store.setMenuNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, sizingInformation) => LayoutBuilder(
            builder: (context, constraints) => Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  color: constStyle.backgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.resolveWith(
                                    (value) => EdgeInsets.zero),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (value) => Colors.transparent),
                                overlayColor: MaterialStateProperty.resolveWith(
                                    (value) => Colors.transparent),
                              ),
                              onPressed: () {},
                              child: CircleAvatar(
                                backgroundColor: constStyle.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    constStyle.face,
                                    height: 100,
                                    width: 100,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.resolveWith(
                                    (value) => EdgeInsets.zero),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (value) => Colors.transparent),
                                overlayColor: MaterialStateProperty.resolveWith(
                                    (value) => Colors.transparent),
                              ),
                              onPressed: () {},
                              child: CircleAvatar(
                                backgroundColor: constStyle.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    constStyle.twitter,
                                    height: 100,
                                    width: 100,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.resolveWith(
                                    (value) => EdgeInsets.zero),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (value) => Colors.transparent),
                                overlayColor: MaterialStateProperty.resolveWith(
                                    (value) => Colors.transparent),
                              ),
                              onPressed: () {},
                              child: CircleAvatar(
                                backgroundColor: constStyle.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    constStyle.instagram,
                                    height: 100,
                                    width: 100,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.resolveWith(
                                    (value) => EdgeInsets.zero),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (value) => Colors.transparent),
                                overlayColor: MaterialStateProperty.resolveWith(
                                    (value) => Colors.transparent),
                              ),
                              onPressed: () {},
                              child: CircleAvatar(
                                backgroundColor: constStyle.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    constStyle.linkedin,
                                    height: 100,
                                    width: 100,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.resolveWith(
                                    (value) => EdgeInsets.zero),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (value) => Colors.transparent),
                                overlayColor: MaterialStateProperty.resolveWith(
                                    (value) => Colors.transparent),
                              ),
                              onPressed: () {},
                              child: CircleAvatar(
                                backgroundColor: constStyle.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    constStyle.pinterest,
                                    height: 100,
                                    width: 100,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ],
                      ),
                      sizingInformation.isDesktop || sizingInformation.isTablet
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: store.menuButtons,
                            )
                          : Wrap(
                              runSpacing: 10,
                              alignment: WrapAlignment.center,
                              children: store.menuButtons,
                            ),
                      const Text(
                        "Design by: Mr.Web Designer - Programming by: Richardson Tsavo",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )));
  }
}
