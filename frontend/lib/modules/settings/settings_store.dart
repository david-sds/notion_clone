import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore extends _SettingsStoreBase with _$SettingsStore {}

abstract class _SettingsStoreBase with Store {
  @observable
  ThemeMode _themeMode = ThemeMode.system;
  @computed
  ThemeMode get themeMode => _themeMode;
  @action
  void setThemeMode(ThemeMode value) => _themeMode = value;
}
