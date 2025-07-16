import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/modules/settings/settings_store.dart';
import 'package:frontend/router/router.dart';

final _settingsStore = Modular.get<SettingsStore>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp.router(
        routerConfig: router,
        title: 'Notion Clone',
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
        themeMode: _settingsStore.themeMode,
      );
    });
  }
}
