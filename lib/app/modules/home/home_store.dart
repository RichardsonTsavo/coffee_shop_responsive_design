import 'package:coffee_shop_website_design/app/shared/utils/localization/localization_system.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  LocalizationSystem localizationSystem = Modular.get();
  String textInfo(String idInfo) {
    switch (localizationSystem.localizationIndex) {
      case 0:
        return localizationSystem.portuguese()[idInfo];
      case 1:
        return localizationSystem.english()[idInfo];
      default:
        return "";
    }
  }
}
