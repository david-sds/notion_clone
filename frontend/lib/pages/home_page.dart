import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/models/document_model.dart';
import 'package:frontend/modules/documents/documents_store.dart';
import 'package:go_router/go_router.dart';

final _documentsStore = Modular.get<DocumentsStore>();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _documentsStore.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Notion Clone Home Page'),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push('/some-route');
          },
          child: const Text('Change Route'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                _documentsStore.load();
              },
              child: const Text('Load'),
            ),
            TextButton(
              onPressed: () {
                _documentsStore.create(
                  const Document(
                    title: 'oi',
                  ),
                );
              },
              child: const Text('Create'),
            ),
            TextButton(
              onPressed: () {
                final documentId = _documentsStore.documents.lastOrNull?.id;
                if (documentId == null) {
                  return;
                }
                _documentsStore.update(
                  documentId,
                  Document(
                    title: _documentsStore.documents.length.toStringAsFixed(1),
                  ),
                );
              },
              child: const Text('Update'),
            ),
            TextButton(
              onPressed: () {
                final documentId = _documentsStore.documents.lastOrNull?.id;
                if (documentId == null) {
                  return;
                }
                _documentsStore.delete(
                  documentId,
                );
              },
              child: const Text('Delete'),
            ),
          ],
        ),
        Observer(
          builder: (context) => Expanded(
            child: ListView(
              shrinkWrap: true,
              children: List.generate(
                _documentsStore.documents.length,
                (index) => Text(
                  _documentsStore.documents[index].title,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
