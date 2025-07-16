import 'package:flutter/material.dart';
import 'package:frontend/ui/settings/widgets/theme_mode_toggle.dart';

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
        actions: const [
          ThemeModeToggle(),
        ],
      ),
      body: child,
    );
  }
}
