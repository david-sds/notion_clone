import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/modules/documents/documents_store.dart';
import 'package:frontend/modules/settings/settings_store.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(() => SettingsStore());
    i.addSingleton(() => DocumentsStore());
  }
}
