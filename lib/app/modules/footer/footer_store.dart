import 'package:coffee_shop_website_design/app/modules/footer/components/menu_buttons_footer.dart';
import 'package:coffee_shop_website_design/app/shared/utils/localization/localization_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'footer_store.g.dart';

class FooterStore = _FooterStoreBase with _$FooterStore;

abstract class _FooterStoreBase with Store {
  final LocalizationSystem localizationSystem = Modular.get();
  ObservableList<Widget> menuButtons = ObservableList();
  void setMenuNames() {
    menuButtons.clear();
    switch (localizationSystem.localizationIndex) {
      case 0:
        for (int i = 0;
            i < localizationSystem.portuguese()["appBar"].length;
            i++) {
          menuButtons.add(MenuButtonsFooter(
            buttonName: localizationSystem.portuguese()["appBar"][i],
            index: i,
          ));
          if (i < localizationSystem.portuguese()["appBar"].length - 1) {
            menuButtons.add(const SizedBox(
              width: 15,
            ));
          }
        }
        break;
      case 1:
        for (int i = 0;
            i < localizationSystem.english()["appBar"].length;
            i++) {
          menuButtons.add(MenuButtonsFooter(
            buttonName: localizationSystem.english()["appBar"][i],
            index: i,
          ));
          if (i < localizationSystem.english()["appBar"].length - 1) {
            menuButtons.add(const SizedBox(
              width: 15,
            ));
          }
        }
        break;
    }
  }
}
