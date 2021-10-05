import 'package:coffee_shop_website_design/app/modules/core/core_store.dart';
import 'package:coffee_shop_website_design/app/modules/review/components/list_item_review.dart';
import 'package:coffee_shop_website_design/app/shared/models/review_model.dart';
import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:coffee_shop_website_design/app/modules/review/review_store.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ReviewPage extends StatefulWidget {
  final String title;
  const ReviewPage({Key? key, this.title = 'ReviewPage'}) : super(key: key);
  @override
  ReviewPageState createState() => ReviewPageState();
}

class ReviewPageState extends State<ReviewPage> {
  final ReviewStore store = Modular.get();
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
                    key: const ValueKey(4),
                    controller: coreStore.scrollController,
                    index: 4,
                    child: const SizedBox(height: 25)),
                Text(
                  store.textInfo("reviewsTitle"),
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
                FutureBuilder<List<ReviewModel>>(
                  future: store.getAllReview(),
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
                                  horizontal:
                                      sizingInformation.isDesktop ? 50 : 15),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          sizingInformation.isDesktop
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
                                return ListItemReview(
                                  image: snapshot.data![index].image!,
                                  name: snapshot.data![index].name!,
                                  avatarRadius: sizingInformation.isDesktop ||
                                          sizingInformation.isTablet
                                      ? size.width / 25
                                      : size.width / 10,
                                  comment: snapshot.data![index].comment!,
                                  rating: snapshot.data![index].rating!,
                                  ratingSize: sizingInformation.isDesktop
                                      ? size.width * 0.02
                                      : sizingInformation.isTablet
                                          ? size.width * 0.03
                                          : size.width * 0.05,
                                  accentSize: sizingInformation.isDesktop
                                      ? size.width * 0.05
                                      : sizingInformation.isTablet
                                          ? size.width * 0.06
                                          : size.width * 0.07,
                                  nameSize: sizingInformation.isDesktop
                                      ? size.width * 0.01
                                      : sizingInformation.isTablet
                                          ? size.width * 0.02
                                          : size.width * 0.04,
                                  commentSize: sizingInformation.isDesktop
                                      ? size.width * 0.01
                                      : sizingInformation.isTablet
                                          ? size.width * 0.02
                                          : size.width * 0.04,
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
            ));
  }
}
