import 'package:coffee_shop_website_design/app/modules/about/about_module.dart';
import 'package:coffee_shop_website_design/app/modules/app_bar/app_bar_page.dart';
import 'package:coffee_shop_website_design/app/modules/blog/blog_module.dart';
import 'package:coffee_shop_website_design/app/modules/contact/contact_module.dart';
import 'package:coffee_shop_website_design/app/modules/footer/footer_module.dart';
import 'package:coffee_shop_website_design/app/modules/home/home_module.dart';
import 'package:coffee_shop_website_design/app/modules/latest_products/latest_products_module.dart';
import 'package:coffee_shop_website_design/app/modules/menu/menu_module.dart';
import 'package:coffee_shop_website_design/app/modules/review/review_module.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:coffee_shop_website_design/app/modules/core/core_store.dart';
import 'package:flutter/material.dart';

class CorePage extends StatefulWidget {
  final String title;
  const CorePage({Key? key, this.title = 'CorePage'}) : super(key: key);
  @override
  CorePageState createState() => CorePageState();
}

class CorePageState extends State<CorePage> {
  final CoreStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Scaffold(
              backgroundColor: Colors.black,
              body: SafeArea(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Observer(
                      builder: (context) => SingleChildScrollView(
                        controller: store.scrollController,
                        physics: store.mapIsHover
                            ? const NeverScrollableScrollPhysics()
                            : const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(
                                height: constraints.maxHeight,
                                width: constraints.maxWidth,
                                child: HomeModule()),
                            SizedBox(
                                height: constraints.maxHeight,
                                width: constraints.maxWidth,
                                child: AboutModule()),
                            MenuModule(),
                            LatestProductsModule(),
                            ReviewModule(),
                            SizedBox(
                                height: constraints.maxHeight,
                                width: constraints.maxWidth,
                                child: ContactModule()),
                            BlogModule(),
                            SizedBox(
                              height: constraints.maxHeight / 3.5,
                              width: constraints.maxWidth,
                              child: FooterModule(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const AppBarPage(),
                        Container(
                          height: 1,
                          width: constraints.maxWidth,
                          color: Colors.white.withAlpha(50),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
