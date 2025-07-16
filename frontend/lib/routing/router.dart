import 'package:frontend/ui/core/main_layout_screen.dart';
import 'package:frontend/ui/core/not_found_screen.dart';
import 'package:frontend/ui/documents/widgets/documents_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainLayout(child: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => DocumentsScreen(
            viewmodel: context.read(),
          ),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const MainLayout(child: NotFoundPage()),
);
