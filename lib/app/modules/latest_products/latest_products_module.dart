import 'package:coffee_shop_website_design/app/modules/latest_products/latest_products_page.dart';
import 'package:coffee_shop_website_design/app/modules/latest_products/latest_products_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LatestProductsModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LatestProductsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LatestProductsPage()),
  ];

  @override
  // TODO: implement view
  Widget get view => const LatestProductsPage();
}
