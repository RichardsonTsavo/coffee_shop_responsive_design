import 'package:coffee_shop_website_design/app/shared/models/product_model.dart';
import 'package:coffee_shop_website_design/app/shared/service/products/requests_repository.dart';
import 'package:coffee_shop_website_design/app/shared/service/products/requests_repository_interface.dart';
import 'package:coffee_shop_website_design/app/shared/utils/localization/localization_system.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'menu_store.g.dart';

class MenuStore = _MenuStoreBase with _$MenuStore;

abstract class _MenuStoreBase with Store {
  LocalizationSystem localizationSystem = Modular.get();
  final IRequestsRepository _getProductsRepository = RequestsRepository();

  Future<List<ProductModel>> getAllMenuProducts() {
    return _getProductsRepository.getMenuProducts();
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
}
