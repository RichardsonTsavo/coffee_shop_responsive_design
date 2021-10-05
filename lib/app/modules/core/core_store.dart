import 'package:coffee_shop_website_design/app/shared/utils/localization/localization_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

part 'core_store.g.dart';

class CoreStore = _CoreStoreBase with _$CoreStore;

abstract class _CoreStoreBase with Store {
  final LocalizationSystem localizationSystem = Modular.get();
  AutoScrollController scrollController = AutoScrollController();
  @observable
  bool mapIsHover = false;

  void setScroll({required int index}) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.scrollToIndex(index,
            preferPosition: AutoScrollPosition.begin,
            duration: const Duration(seconds: 2));
      }
    });
  }

  @action
  void setMapIsHover(bool value) {
    mapIsHover = value;
  }
}
