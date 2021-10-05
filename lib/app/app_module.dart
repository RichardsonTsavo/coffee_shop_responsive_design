import 'package:coffee_shop_website_design/app/modules/app_bar/app_bar_store.dart';
import 'package:coffee_shop_website_design/app/modules/core/core_module.dart';
import 'package:coffee_shop_website_design/app/modules/core/core_store.dart';
import 'package:coffee_shop_website_design/app/modules/splash/splash_module.dart';
import 'package:coffee_shop_website_design/app/modules/splash/splash_store.dart';
import 'package:coffee_shop_website_design/app/shared/utils/localization/localization_system.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AppBarStore()),
    Bind.lazySingleton((i) => CoreStore()),
    Bind.lazySingleton((i) => SplashStore()),
    Bind.lazySingleton((i) => LocalizationSystem()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute("/core", module: CoreModule()),
  ];

}