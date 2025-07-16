import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/app.dart';
import 'package:frontend/modules/app_module.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  await dotenv.load(fileName: 'env');
  setPathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(
    ModularApp(
      module: AppModule(),
      child: const App(),
    ),
  );
}
