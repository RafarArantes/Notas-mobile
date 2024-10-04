import 'package:aps/models/note_model.dart';
import 'package:flutter/material.dart';

class NoteDetail extends StatelessWidget {
  const NoteDetail(
      {super.key,
      required this.note,
      required this.onDelete,
      required this.index});

  final Note note;
  final Function(int) onDelete;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Chama a função de deletar e volta para a tela anterior
              onDelete(index);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              note.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              note.body,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
