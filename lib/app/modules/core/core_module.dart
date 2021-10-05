import 'package:coffee_shop_website_design/app/modules/core/core_Page.dart';
import 'package:coffee_shop_website_design/app/modules/core/core_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CoreStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CorePage()),
  ];
}
