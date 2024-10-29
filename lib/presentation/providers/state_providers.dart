import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'state_providers.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() => 5;

  void increaseByOne() {
    state++;
  }
}

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() => false;

  void toggleThemeMode() {
    state = !state;
  }
}

@riverpod
class UserName extends _$UserName {
  @override
  String build() => '@JaViKo.500';

  void changeName( String name ) {
    state = name;
  }
}