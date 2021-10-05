import 'package:coffee_shop_website_design/app/modules/blog/components/list_item_posts_blog.dart';
import 'package:coffee_shop_website_design/app/modules/core/core_store.dart';
import 'package:coffee_shop_website_design/app/shared/models/posts_blog_model.dart';
import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:coffee_shop_website_design/app/modules/blog/blog_store.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class BlogPage extends StatefulWidget {
  final String title;
  const BlogPage({Key? key, this.title = 'BlogPage'}) : super(key: key);
  @override
  BlogPageState createState() => BlogPageState();
}

class BlogPageState extends State<BlogPage> {
  final BlogStore store = Modular.get();
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
                    key: const ValueKey(6),
                    controller: coreStore.scrollController,
                    index: 6,
                    child: const SizedBox(height: 25)),
                Text(
                  store.textInfo("blogTitle"),
                  style: TextStyle(
                      color: constStyle.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: sizingInformation.isDesktop
                          ? size.width * 0.03
                          : size.width * 0.1),
                ),
                const SizedBox(
                  height: 25,
                ),
                FutureBuilder<List<PostsBlog>>(
                  future: store.getAllPostsBlog(),
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
                                return ListItemPostsBlog(
                                  image: snapshot.data![index].image!,
                                  userName: snapshot.data![index].userName!,
                                  title: snapshot.data![index].title!,
                                  comment: snapshot.data![index].comment!,
                                  date: snapshot.data![index].date!,
                                  imageHeight: size.height / 2.5,
                                  imageWidth: sizingInformation.isDesktop
                                      ? size.width / 2
                                      : size.width,
                                  buttonText: store.textInfo("buttonSeeMore"),
                                  commentSize: sizingInformation.isDesktop
                                      ? size.width * 0.01
                                      : sizingInformation.isTablet
                                          ? size.width * 0.02
                                          : size.width * 0.04,
                                  buttonTextSize: sizingInformation.isDesktop
                                      ? size.width * 0.01
                                      : sizingInformation.isTablet
                                          ? size.width * 0.02
                                          : size.width * 0.04,
                                  titleSize: sizingInformation.isDesktop
                                      ? size.width * 0.01
                                      : sizingInformation.isTablet
                                          ? size.width * 0.02
                                          : size.width * 0.04,
                                  userNameAndDateSize:
                                      sizingInformation.isDesktop
                                          ? size.width * 0.01
                                          : sizingInformation.isTablet
                                              ? size.width * 0.02
                                              : size.width * 0.04,
                                );
                              }),
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
