import 'package:coffee_shop_website_design/app/modules/review/review_Page.dart';
import 'package:coffee_shop_website_design/app/modules/review/review_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ReviewModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ReviewStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ReviewPage()),
  ];

  @override
  // TODO: implement view
  Widget get view => const ReviewPage();
}
