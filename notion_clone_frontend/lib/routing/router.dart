import 'package:go_router/go_router.dart';
import 'package:notion_clone_frontend/ui/core/widgets/layout/main_layout_screen.dart';
import 'package:notion_clone_frontend/ui/core/widgets/not_found_screen.dart';
import 'package:notion_clone_frontend/ui/documents/widgets/documents_screen.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainLayoutScreen(child: child),
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
  errorBuilder: (context, state) => const MainLayoutScreen(
    child: NotFoundScreen(),
  ),
);
