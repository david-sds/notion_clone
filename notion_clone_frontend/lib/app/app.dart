import 'package:flutter/material.dart';
import 'package:notion_clone_frontend/core/routing/router.dart';
import 'package:notion_clone_frontend/ui/settings/view_models/settings_viewmodel.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final settingsViewmodel = context.read<SettingsViewmodel>();

    return ListenableBuilder(
      listenable: settingsViewmodel,
      builder: (context, _) {
        return MaterialApp.router(
          routerConfig: router,
          title: 'Notion Clone',
          darkTheme: ThemeData.dark(),
          theme: ThemeData.light(),
          themeMode: settingsViewmodel.themeMode,
        );
      },
    );
  }
}
