import 'package:aps/models/note_model.dart';
import 'package:flutter/material.dart';
import 'create_note.dart';
import 'package:aps/screens/widgets/note_card.dart';
import 'note_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notas Cabulosas"),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return GestureDetector(
            onTap: () {
              // Navega para a tela de detalhes ao clicar na nota
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NoteDetail(
                    note: note,
                    index: index,
                    onDelete: onNoteDeleted, // Passa a função de deletar
                  ),
                ),
              );
            },
            child: NoteCard(note: note, index: index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  CreateNote(onNewNoteCreated: onNewNoteCreated),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void onNewNoteCreated(Note note) {
    setState(() {
      notes.add(note);
    });
  }

  void onNoteDeleted(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }
}
