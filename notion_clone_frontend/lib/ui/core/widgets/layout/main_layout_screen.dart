import 'package:flutter/material.dart';
import 'package:notion_clone_frontend/ui/settings/widgets/theme_mode_toggle.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          ThemeModeToggle(),
        ],
      ),
      body: child,
    );
  }
}
