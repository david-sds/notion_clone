import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notion_clone_frontend/app/app.dart';
import 'package:notion_clone_frontend/config/dependencies.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(
    MultiProvider(
      providers: providers,
      child: const App(),
    ),
  );
}
