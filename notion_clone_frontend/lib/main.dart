import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notion_clone_frontend/app/app.dart';
import 'package:notion_clone_frontend/data/services/local/database.dart';
import 'package:notion_clone_frontend/data/services/local/documents/documents_dao.dart';
import 'package:notion_clone_frontend/ui/documents/view_models/documents_viewmodel.dart';
import 'package:notion_clone_frontend/ui/settings/view_models/settings_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => AppDatabase()),
        Provider(create: (context) => DocumentsDao(context.read())),
        ChangeNotifierProvider(create: (_) => SettingsViewmodel()),
        ChangeNotifierProvider(
          create: (context) => DocumentsViewmodel(documentsDao: context.read()),
        ),
      ],
      child: const App(),
    ),
  );
}
