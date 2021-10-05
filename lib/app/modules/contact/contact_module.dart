import 'package:coffee_shop_website_design/app/modules/contact/contact_Page.dart';
import 'package:coffee_shop_website_design/app/modules/contact/contact_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContactModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ContactStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ContactPage()),
  ];

  @override
  // TODO: implement view
  Widget get view => const ContactPage();
}
