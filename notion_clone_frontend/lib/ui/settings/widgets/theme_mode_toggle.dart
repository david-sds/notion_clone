import 'package:flutter/material.dart';
import 'package:notion_clone_frontend/ui/settings/view_models/settings_viewmodel.dart';
import 'package:provider/provider.dart';

class ThemeModeToggle extends StatefulWidget {
  const ThemeModeToggle({super.key});

  @override
  State<ThemeModeToggle> createState() => _ThemeModeToggleState();
}

class _ThemeModeToggleState extends State<ThemeModeToggle> {
  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<SettingsViewmodel>();

    return ListenableBuilder(
      listenable: viewmodel,
      builder: (context, _) {
        return Switch(
          value: viewmodel.themeMode == ThemeMode.light,
          onChanged: (value) => viewmodel.setThemeMode(
            value ? ThemeMode.light : ThemeMode.dark,
          ),
        );
      },
    );
  }
}
