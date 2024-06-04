import 'package:flutter/material.dart';
import 'package:piconote/models/note.dart';
import 'package:piconote/models/note_database.dart';
import 'package:provider/provider.dart';

class OpenNotePage extends StatefulWidget {
  final String title;
  final String body;
  final Note iden;
  const OpenNotePage(
      {super.key, required this.title, required this.body, required this.iden});

  @override
  State<OpenNotePage> createState() => _OpenNotePageState();
}

class _OpenNotePageState extends State<OpenNotePage> {
  // Text controller to access whatever the user types
  final textcontroller = TextEditingController();
  final notecontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textcontroller.text = widget.title;
    notecontroller.text = widget.body;
  }

  void updateNote(Note note) {
    context
        .read<NoteDatabase>()
        .updateNote(note.id, textcontroller.text, notecontroller.text);
    // clear controller
    textcontroller.clear();
    // pop dialog box
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          MaterialButton(
            onPressed: () {
              updateNote(widget.iden);
            },
            child: Text('Save'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10),
            child: Column(
              children: [
                // Title

                TextField(
                  controller: textcontroller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),

                //Note
                TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  controller: notecontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Note',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
