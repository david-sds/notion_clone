import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/modules/settings/settings_store.dart';

final _settingsStore = Modular.get<SettingsStore>();

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Observer(builder: (context) {
            return Switch(
              value: _settingsStore.themeMode == ThemeMode.light,
              onChanged: (value) => _settingsStore.setThemeMode(
                value ? ThemeMode.light : ThemeMode.dark,
              ),
            );
          }),
        ],
      ),
      body: child,
    );
  }
}
