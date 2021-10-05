// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoreStore on _CoreStoreBase, Store {
  final _$mapIsHoverAtom = Atom(name: '_CoreStoreBase.mapIsHover');

  @override
  bool get mapIsHover {
    _$mapIsHoverAtom.reportRead();
    return super.mapIsHover;
  }

  @override
  set mapIsHover(bool value) {
    _$mapIsHoverAtom.reportWrite(value, super.mapIsHover, () {
      super.mapIsHover = value;
    });
  }

  final _$_CoreStoreBaseActionController =
      ActionController(name: '_CoreStoreBase');

  @override
  void setMapIsHover(bool value) {
    final _$actionInfo = _$_CoreStoreBaseActionController.startAction(
        name: '_CoreStoreBase.setMapIsHover');
    try {
      return super.setMapIsHover(value);
    } finally {
      _$_CoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mapIsHover: ${mapIsHover}
    ''';
  }
}
