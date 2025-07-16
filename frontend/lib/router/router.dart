import 'package:frontend/layouts/main_layout.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:frontend/pages/not_found_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainLayout(child: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const MainLayout(child: NotFoundPage()),
);
