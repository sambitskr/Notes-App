import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:piconote/models/note.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

  //I N I T I A L I Z E - D A T A B A S E
  static Future<void> initialize() async {
    final dir = await getApplicationCacheDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  //list of notes
  final List<Note> currentNotes = [];

  // C R E A T E
  Future<void> addNote(String textFromUser, String noteFromUser) async {
    //create a new note object
    final newNote = Note(text: textFromUser, content: noteFromUser);
    // final newNote = Note()..text = textFromUser;
    // final newText = Note()..content = noteFromUser;

    //save to db
    await isar.writeTxn(() => isar.notes.put(newNote));
    // await isar.writeTxn(() => isar.notes.put(newText));

    //re-read from the db
    fetchNotes();
  }

  // R E A D
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  //U P D A T E
  Future<void> updateNote(int id, String newText, String newNote) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      existingNote.content = newNote;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  // D E L E T E
  Future<void> deleteNode(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
