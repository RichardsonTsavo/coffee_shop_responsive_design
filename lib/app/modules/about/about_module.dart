import 'package:coffee_shop_website_design/app/modules/about/about_Page.dart';
import 'package:coffee_shop_website_design/app/modules/about/about_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AboutModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AboutStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AboutPage()),
  ];

  @override
  // TODO: implement view
  Widget get view => const AboutPage();
}
