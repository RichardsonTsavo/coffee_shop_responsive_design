import 'package:coffee_shop_website_design/app/modules/core/core_store.dart';
import 'package:coffee_shop_website_design/app/modules/latest_products/components/list_item_latest.dart';
import 'package:coffee_shop_website_design/app/shared/models/product_model.dart';
import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:coffee_shop_website_design/app/modules/latest_products/latest_products_store.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class LatestProductsPage extends StatefulWidget {
  final String title;
  const LatestProductsPage({Key? key, this.title = 'LatestProductsPage'})
      : super(key: key);
  @override
  LatestProductsPageState createState() => LatestProductsPageState();
}

class LatestProductsPageState extends State<LatestProductsPage> {
  final LatestProductsStore store = Modular.get();
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
              key: const ValueKey(3),
              controller: coreStore.scrollController,
              index: 3,
              child: const SizedBox(height: 25)),
          Text(
            store.textInfo("lastestTitle"),
            style: TextStyle(
                color: constStyle.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: sizingInformation.isDesktop
                    ? size.width * 0.03
                    : size.width * 0.1),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          ),
          FutureBuilder<List<ProductModel>>(
            future: store.getAllLastProducts(),
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
                            horizontal: sizingInformation.isDesktop ? 50 : 15),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: sizingInformation.isDesktop
                                ? 3
                                : sizingInformation.isTablet
                                    ? 2
                                    : 1,
                            childAspectRatio: 1,
                            mainAxisExtent: size.height / 1.3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        itemCount: snapshot.data!.length > 3
                            ? 3
                            : snapshot.data!.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return ListItemLatest(
                            image: snapshot.data![index].image!,
                            name: snapshot.data![index].name!,
                            promotionalPrice:
                                snapshot.data![index].promotionalPrice!,
                            price: snapshot.data![index].price!,
                            rating: snapshot.data![index].rating!,
                            ratingSize: sizingInformation.isDesktop
                                ? size.width * 0.02
                                : sizingInformation.isTablet
                                    ? size.width * 0.03
                                    : size.width * 0.05,
                            priceSize: sizingInformation.isDesktop
                                ? size.width * 0.01
                                : sizingInformation.isTablet
                                    ? size.width * 0.02
                                    : size.width * 0.04,
                            nameSize: sizingInformation.isDesktop
                                ? size.width * 0.015
                                : sizingInformation.isTablet
                                    ? size.width * 0.02
                                    : size.width * 0.04,
                            promotionalPriceSize: sizingInformation.isDesktop
                                ? size.width * 0.02
                                : sizingInformation.isTablet
                                    ? size.width * 0.03
                                    : size.width * 0.05,
                          );
                        }),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: constStyle.primaryColor),
                        onPressed: () {},
                        child: Text(store.textInfo("buttonSeeMore")))
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white)),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
