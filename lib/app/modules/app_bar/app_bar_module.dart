import 'package:coffee_shop_website_design/app/modules/app_bar/app_bar_page.dart';
import 'package:coffee_shop_website_design/app/modules/app_bar/app_bar_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AppBarStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AppBarPage()),
  ];

  @override
  // TODO: implement view
  Widget get view => const AppBarPage();
}
