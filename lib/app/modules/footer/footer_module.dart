import 'package:coffee_shop_website_design/app/modules/footer/footer_Page.dart';
import 'package:coffee_shop_website_design/app/modules/footer/footer_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FooterModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FooterStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const FooterPage()),
  ];

  @override
  // TODO: implement view
  Widget get view => const FooterPage();
}
