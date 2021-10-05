import 'package:coffee_shop_website_design/app/modules/app_bar/app_bar_store.dart';
import 'package:coffee_shop_website_design/app/modules/core/core_store.dart';
import 'package:coffee_shop_website_design/app/modules/menu/components/list_item_menu.dart';
import 'package:coffee_shop_website_design/app/shared/models/product_model.dart';
import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:coffee_shop_website_design/app/modules/menu/menu_store.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MenuPage extends StatefulWidget {
  final String title;
  const MenuPage({Key? key, this.title = 'MenuPage'}) : super(key: key);
  @override
  MenuPageState createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  final MenuStore store = Modular.get();
  final AppBarStore appBarStore = Modular.get();
  final CoreStore coreStore = Modular.get();
  final ConstStyle constStyle = ConstStyle();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
        builder: (context, sizingInformation) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AutoScrollTag(
                key: const ValueKey(2),
                controller: coreStore.scrollController,
                index: 2,
                child: Text(store.textInfo("menuTitle"),
                    style: TextStyle(
                        color: constStyle.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: sizingInformation.isDesktop
                            ? size.width * 0.03
                            : size.width * 0.1))),
            const SizedBox(
              height: 25,
            ),
            FutureBuilder<List<ProductModel>>(
              future: store.getAllMenuProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                              horizontal: sizingInformation.isDesktop
                                  ? 50
                                  : 15),
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                              sizingInformation.isDesktop
                                  ? 3
                                  : sizingInformation.isTablet
                                  ? 2
                                  : 1,
                              childAspectRatio: 1,
                              mainAxisExtent: size.height / 2.5,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                          itemCount: snapshot.data!.length > 6
                              ? 6
                              : snapshot.data!.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return ListItemMenu(
                              image: snapshot.data![index].image!,
                              name: snapshot.data![index].name!,
                              avatarRadius:
                              sizingInformation.isDesktop ||
                                  sizingInformation.isTablet
                                  ? size.width / 25
                                  : size.width / 10,
                              nameSize: sizingInformation.isDesktop
                                  ? size.width * 0.01
                                  : sizingInformation.isTablet
                                  ? size.width * 0.02
                                  : size.width * 0.04,
                              priceSize: sizingInformation.isDesktop
                                  ? size.width * 0.01
                                  : sizingInformation.isTablet
                                  ? size.width * 0.02
                                  : size.width * 0.04,
                              buttonTextSize:
                              sizingInformation.isDesktop
                                  ? size.width * 0.01
                                  : sizingInformation.isTablet
                                  ? size.width * 0.02
                                  : size.width * 0.04,
                              promotionalPriceSize:
                              sizingInformation.isDesktop
                                  ? size.width * 0.02
                                  : sizingInformation.isTablet
                                  ? size.width * 0.03
                                  : size.width * 0.05,
                              promotionalPrice: snapshot
                                  .data![index].promotionalPrice!,
                              price: snapshot.data![index].price!,
                              buttonText: store.textInfo("menuButton"),
                              onPressed: () {
                                appBarStore
                                    .setListCart(snapshot.data![index]);
                              },
                              isDesktop: sizingInformation.isDesktop,
                            );
                          }),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: constStyle.primaryColor),
                          onPressed: () {},
                          child: Text(store.textInfo("buttonSeeMore"))),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                        valueColor:
                        AlwaysStoppedAnimation(Colors.white)),
                  );
                }
              },
            ),
          ],
        ));
  }
}
