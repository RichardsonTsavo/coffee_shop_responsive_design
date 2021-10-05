import 'package:coffee_shop_website_design/app/modules/core/core_store.dart';
import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:coffee_shop_website_design/app/modules/about/about_store.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class AboutPage extends StatefulWidget {
  final String title;
  const AboutPage({Key? key, this.title = 'AboutPage'}) : super(key: key);
  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  final AboutStore store = Modular.get();
  final CoreStore coreStore = Modular.get();
  final ConstStyle constStyle = ConstStyle();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, sizingInformation) => LayoutBuilder(
            builder: (context, constraints) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AutoScrollTag(
                      key: const ValueKey(1),
                      controller: coreStore.scrollController,
                      index: 1,
                      child: Text(
                        store.textInfo("aboutTitle"),
                        style: TextStyle(
                            color: constStyle.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: sizingInformation.isDesktop
                                ? constraints.maxWidth * 0.03
                                : constraints.maxWidth * 0.1),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizingInformation.isDesktop ? 50 : 15),
                        child: sizingInformation.isDesktop ||
                                sizingInformation.isTablet
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 50,
                                    child: Container(
                                      height: constraints.maxHeight / 1.6,
                                      color: constStyle.backgroundColor,
                                      child: Image.asset(
                                        constStyle.aboutImg,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 50,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      height: constraints.maxHeight / 1.6,
                                      color: constStyle.backgroundColor,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            store.textInfo("aboutTxt1"),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: constraints.maxWidth *
                                                    0.02),
                                          ),
                                          Text(
                                            store.textInfo("aboutTxt2"),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: constraints.maxWidth *
                                                    0.013),
                                          ),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary:
                                                      constStyle.primaryColor),
                                              onPressed: () {},
                                              child: Text(
                                                  store.textInfo("aboutTxt3")))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(
                                height: constraints.maxHeight * 0.9,
                                width: constraints.maxWidth,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 50,
                                      child: Container(
                                        height: constraints.maxHeight / 1.6,
                                        width: constraints.maxWidth,
                                        color: constStyle.backgroundColor,
                                        child: Image.asset(
                                          constStyle.aboutImg,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 50,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        height: constraints.maxHeight / 1.6,
                                        color: constStyle.backgroundColor,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              store.textInfo("aboutTxt1"),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: sizingInformation
                                                          .isDesktop
                                                      ? constraints.maxWidth *
                                                          0.02
                                                      : sizingInformation
                                                              .isTablet
                                                          ? constraints
                                                                  .maxWidth *
                                                              0.03
                                                          : constraints
                                                                  .maxWidth *
                                                              0.04),
                                            ),
                                            Text(
                                              store.textInfo("aboutTxt2"),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: sizingInformation
                                                          .isDesktop
                                                      ? constraints.maxWidth *
                                                          0.013
                                                      : sizingInformation
                                                              .isTablet
                                                          ? constraints
                                                                  .maxWidth *
                                                              0.02
                                                          : constraints
                                                                  .maxWidth *
                                                              0.03),
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: constStyle
                                                        .primaryColor),
                                                onPressed: () {},
                                                child: Text(store
                                                    .textInfo("aboutTxt3")))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                  ],
                )));
  }
}
