import 'package:coffee_shop_website_design/app/modules/app_bar/components/menu_button_appbar.dart';
import 'package:coffee_shop_website_design/app/modules/splash/splash_store.dart';
import 'package:coffee_shop_website_design/app/shared/models/product_model.dart';
import 'package:coffee_shop_website_design/app/shared/utils/functions/double_to_formatting_to_money_string.dart';
import 'package:coffee_shop_website_design/app/shared/utils/localization/localization_system.dart';
import 'package:coffee_shop_website_design/app/shared/utils/snackbar/global_snack_bar.dart';
import 'package:coffee_shop_website_design/app/shared/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'app_bar_store.g.dart';

class AppBarStore = _AppBarStoreBase with _$AppBarStore;

abstract class _AppBarStoreBase with Store {
  final LocalizationSystem localizationSystem = Modular.get();
  ObservableList<MenuButtonAppBar> menuButtons = ObservableList();
  ObservableList<bool> menuButtonsOnHover =
      [false, false, false].asObservable();
  final ConstStyle constStyle = ConstStyle();
  ObservableList<PopupMenuItem> listCart = ObservableList();
  final GlobalSnackBar snackBar = const GlobalSnackBar();

  @action
  void setListCart(ProductModel productModel) {
    listCart.add(PopupMenuItem(
      value: productModel.id,
      child: ListTile(
        title: Text(
          productModel.name!,
          style: const TextStyle(color: Colors.black),
        ),
        leading: Image.asset(productModel.image!),
        trailing: IconButton(
          onPressed: () {
            removeListCart(productModel.id!);
          },
          icon: const Icon(
            Icons.cancel,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          doubleToFormattingToMoneyString(productModel.promotionalPrice!),
          style: const TextStyle(color: Colors.black),
        ),
      ),
    ));
    snackBar.showSnackBar(
        child: Text(textInfo("mensageAddProduct")),
        duration: const Duration(seconds: 3));
  }

  @action
  void removeListCart(int id) {
    for (int i = 0; i < listCart.length; i++) {
      if (listCart[i].value == id) {
        listCart.removeAt(i);
        Modular.to.pop();
      }
    }
    snackBar.showSnackBar(
        child: Text(textInfo("mensageRemovedProduct")),
        duration: const Duration(seconds: 3));
  }

  void setMenuNames() {
    menuButtons.clear();
    menuButtonsOnHover = [false, false, false].asObservable();
    switch (localizationSystem.localizationIndex) {
      case 0:
        for (int i = 0;
            i < localizationSystem.portuguese()["appBar"].length;
            i++) {
          menuButtons.add(MenuButtonAppBar(
            nameButton: localizationSystem.portuguese()["appBar"][i],
            index: i,
          ));
        }
        break;
      case 1:
        for (int i = 0;
            i < localizationSystem.english()["appBar"].length;
            i++) {
          menuButtons.add(MenuButtonAppBar(
            nameButton: localizationSystem.english()["appBar"][i],
            index: i,
          ));
        }
        break;
    }
  }

  Widget iconFlag() {
    switch (localizationSystem.localizationIndex) {
      case 0:
        return Image.asset(constStyle.flagBrasil);
      case 1:
        return Image.asset(constStyle.flagEua);
      default:
        return const Icon(Icons.flag);
    }
  }

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

  void setLanguage(int index) {
    SplashStore store = Modular.get();
    localizationSystem.localizationIndex = index;
    Modular.to.pop();
    Future.delayed(const Duration(seconds: 1)).then((value) => store.changeToCore());
  }

  @action
  void setMenuButtonsOnHover({required int index, required bool value}) {
    menuButtonsOnHover[index] = value;
  }
}
