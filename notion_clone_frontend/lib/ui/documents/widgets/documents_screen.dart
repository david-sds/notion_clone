import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notion_clone_frontend/domain/models/document/document_model.dart';
import 'package:notion_clone_frontend/ui/documents/view_models/documents_viewmodel.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({
    required this.viewmodel,
    super.key,
  });

  final DocumentsViewmodel viewmodel;

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  @override
  void initState() {
    widget.viewmodel.load();
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
                widget.viewmodel.load();
              },
              child: const Text('Load'),
            ),
            TextButton(
              onPressed: () {
                widget.viewmodel.create(
                  const Document(
                    title: 'oi',
                  ),
                );
              },
              child: const Text('Create'),
            ),
            TextButton(
              onPressed: () {
                final documentId = widget.viewmodel.documents.lastOrNull?.id;
                if (documentId == null) {
                  return;
                }
                widget.viewmodel.update(
                  documentId,
                  Document(
                    title: widget.viewmodel.documents.length.toStringAsFixed(1),
                  ),
                );
              },
              child: const Text('Update'),
            ),
            TextButton(
              onPressed: () {
                final documentId = widget.viewmodel.documents.lastOrNull?.id;
                if (documentId == null) {
                  return;
                }
                widget.viewmodel.delete(
                  documentId,
                );
              },
              child: const Text('Delete'),
            ),
          ],
        ),
        ListenableBuilder(
          listenable: widget.viewmodel,
          builder: (context, _) => Expanded(
            child: ListView(
              shrinkWrap: true,
              children: List.generate(
                widget.viewmodel.documents.length,
                (index) => Text(
                  widget.viewmodel.documents[index].title,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
