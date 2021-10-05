import 'package:coffee_shop_website_design/app/modules/menu/menu_Page.dart';
import 'package:coffee_shop_website_design/app/modules/menu/menu_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MenuStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const MenuPage()),
  ];

  @override
  // TODO: implement view
  Widget get view => const MenuPage();
}
