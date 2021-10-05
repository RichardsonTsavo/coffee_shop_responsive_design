import 'package:coffee_shop_website_design/app/modules/blog/blog_Page.dart';
import 'package:coffee_shop_website_design/app/modules/blog/blog_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BlogModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => BlogStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const BlogPage()),
  ];

  @override
  // TODO: implement view
  Widget get view => const BlogPage();
}
