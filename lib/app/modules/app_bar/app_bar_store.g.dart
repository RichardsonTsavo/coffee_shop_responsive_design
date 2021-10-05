// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppBarStore on _AppBarStoreBase, Store {
  final _$_AppBarStoreBaseActionController =
      ActionController(name: '_AppBarStoreBase');

  @override
  void setListCart(ProductModel productModel) {
    final _$actionInfo = _$_AppBarStoreBaseActionController.startAction(
        name: '_AppBarStoreBase.setListCart');
    try {
      return super.setListCart(productModel);
    } finally {
      _$_AppBarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeListCart(int id) {
    final _$actionInfo = _$_AppBarStoreBaseActionController.startAction(
        name: '_AppBarStoreBase.removeListCart');
    try {
      return super.removeListCart(id);
    } finally {
      _$_AppBarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMenuButtonsOnHover({required int index, required bool value}) {
    final _$actionInfo = _$_AppBarStoreBaseActionController.startAction(
        name: '_AppBarStoreBase.setMenuButtonsOnHover');
    try {
      return super.setMenuButtonsOnHover(index: index, value: value);
    } finally {
      _$_AppBarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
