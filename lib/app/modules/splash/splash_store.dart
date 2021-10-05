import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;
abstract class _SplashStoreBase with Store {

  void changeToCore(){
    Future.delayed(const Duration(milliseconds: 200)).then((value) =>
        Modular.to.pushNamed("/core/"));
  }
}