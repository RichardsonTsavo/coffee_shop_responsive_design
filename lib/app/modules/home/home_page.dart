import 'package:coffee_shop_website_design/app/modules/core/core_store.dart';
import 'package:coffee_shop_website_design/app/modules/home/home_store.dart';
import 'package:coffee_shop_website_design/app/shared/utils/localization/localization_system.dart';
import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final ConstStyle constStyle = ConstStyle();
  final CoreStore coreStore = Modular.get();
  final LocalizationSystem localizationSystem = Modular.get();
  @override
  Widget build(BuildContext context) {
    return AutoScrollTag(
        key: const ValueKey(0),
        controller: coreStore.scrollController,
        index: 0,
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) => LayoutBuilder(
              builder: (context, constraints) => Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        child: Image.asset(
                          constStyle.homeImg,
                          fit: BoxFit.cover,
                        ),
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                      ),
                      sizingInformation.isDesktop
                          ? Positioned(
                              top: constraints.maxHeight / 4,
                              left: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(store.textInfo("homeTxt1"),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              constraints.maxWidth * 0.04)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(store.textInfo("homeTxt2"),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              constraints.maxWidth * 0.01)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (value) =>
                                                    constStyle.primaryColor),
                                      ),
                                      child: Text(store.textInfo("buttonHome")))
                                ],
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  store.textInfo("homeTxt1"),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: constraints.maxWidth * 0.1),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  store.textInfo("homeTxt2"),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: constraints.maxWidth * 0.03,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (value) =>
                                                  constStyle.primaryColor),
                                    ),
                                    child: Text(store.textInfo("buttonHome")))
                              ],
                            ),
                    ],
                  )),
        ));
  }
}
