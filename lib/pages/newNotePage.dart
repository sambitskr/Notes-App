import 'package:flutter/material.dart';
import 'package:piconote/models/note_database.dart';
import 'package:provider/provider.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({super.key});

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  // Text controller to access whatever the user types
  final textcontroller = TextEditingController();
  final notecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          MaterialButton(
            onPressed: () {
              // add to db
              context
                  .read<NoteDatabase>()
                  .addNote(textcontroller.text, notecontroller.text);

              //clear the controller
              textcontroller.clear();
              notecontroller.clear();

              // close the create page
              Navigator.pop(context);
            },
            child: Text('Create'),
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
