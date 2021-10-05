import 'package:coffee_shop_website_design/app/shared/utils/localization/localization_system.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'about_store.g.dart';

class AboutStore = _AboutStoreBase with _$AboutStore;

abstract class _AboutStoreBase with Store {
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
