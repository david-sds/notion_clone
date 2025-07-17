import 'package:notion_clone_frontend/data/repository/documents/document_repository_impl.dart';
import 'package:notion_clone_frontend/data/services/local/database.dart';
import 'package:notion_clone_frontend/data/services/local/documents/dao/documents_dao.dart';
import 'package:notion_clone_frontend/data/services/local/operations/dao/operations_dao.dart';
import 'package:notion_clone_frontend/data/services/local/sync_states/dao/sync_states_dao.dart';
import 'package:notion_clone_frontend/data/services/remote/operations/operations_api.dart';
import 'package:notion_clone_frontend/data/services/sync_service/sync_service.dart';
import 'package:notion_clone_frontend/ui/documents/view_models/documents_viewmodel.dart';
import 'package:notion_clone_frontend/ui/settings/view_models/settings_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  Provider(create: (context) => AppDatabase()),
  Provider(create: (context) => OperationsDao(context.read<AppDatabase>())),
  Provider(create: (context) => SyncStatesDao(context.read<AppDatabase>())),
  Provider(create: (context) => DocumentsDao(context.read<AppDatabase>())),
  ChangeNotifierProvider(
    create: (context) => SyncService(
      operationsDao: context.read<OperationsDao>(),
      syncStatesDao: context.read<SyncStatesDao>(),
      operationsApi: OperationsApi(),
    ),
  ),
  ChangeNotifierProvider(create: (_) => SettingsViewmodel()),
  ChangeNotifierProvider(
    create: (context) => DocumentsViewmodel(
      documentsRepository: DocumentRepositoryImpl(
        db: context.read<AppDatabase>(),
        documentsDao: context.read<DocumentsDao>(),
        operationsDao: context.read<OperationsDao>(),
        syncService: context.read<SyncService>(),
      ),
    ),
  ),
];
