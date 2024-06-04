import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piconote/components/drawer.dart';
import 'package:piconote/components/note_title.dart';
import 'package:piconote/models/note.dart';
import 'package:piconote/models/note_database.dart';
import 'package:piconote/pages/newNotePage.dart';
import 'package:piconote/pages/openNotePage.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // Text controller to access whatever the user types
  final textcontroller = TextEditingController();
  final notecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    readNote();
  }

  // create a note
  // void createNote() {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => NewNotePage()));
  //   // showDialog(
  //   //   context: context,
  //   //   builder: (context) => AlertDialog(
  //   //     content: TextField(
  //   //       controller: textcontroller,
  //   //     ),
  //   //     actions: [
  //   //       MaterialButton(
  //   //         onPressed: () {
  //   //           // add to db
  //   //           context.read<NoteDatabase>().addNote(textcontroller.text);

  //   //           //clear the controller
  //   //           textcontroller.clear();

  //   //           // close the dialog box
  //   //           Navigator.pop(context);
  //   //         },
  //   //         child: Text('Create'),
  //   //       ),
  //   //     ],
  //   //   ),
  //   // );
  // }

  //read a note
  void readNote() {
    context.read<NoteDatabase>().fetchNotes();
  }

  //update a note
  void updateNote(Note note) {
    // //pre-fill the current note text
    // textcontroller.text = note.text;
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: Text('Update Note'),
    //     content: TextField(
    //       controller: textcontroller,
    //     ),
    //     actions: [
    //       MaterialButton(
    //         onPressed: () {
    //           context
    //               .read<NoteDatabase>()
    //               .updateNote(note.id, textcontroller.text);
    //           // clear controller
    //           textcontroller.clear();
    //           // pop dialog box
    //           Navigator.pop(context);
    //         },
    //         child: Text('Update'),
    //       )
    //     ],
    //   ),
    // );
  }

  //delete a note
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNode(id);
  }

  @override
  Widget build(BuildContext context) {
    // note database
    final noteDatabase = context.watch<NoteDatabase>();

    //current notes
    List<Note> currentNotes = noteDatabase.currentNotes;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewNotePage()));
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //HEADING
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
              'Notes',
              style: GoogleFonts.dmSerifText(
                fontSize: 48,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          // LIST OF NOTES
          Expanded(
            child: ListView.builder(
                itemCount: currentNotes.length,
                itemBuilder: (context, index) {
                  //get individual note
                  final note = currentNotes[index];

                  //list title UI
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OpenNotePage(
                            title: note.text,
                            body: note.content,
                            iden: note,
                          ),
                        ),
                      );
                    },
                    child: NoteTile(
                      text: note.text,
                      onDeletePressed: () => deleteNote(note.id),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

     // Row(
                          //   mainAxisSize: MainAxisSize.min,
                          //   children: [
                          //     // edit button
                          //     IconButton(
                          //       onPressed: () => updateNote(note),
                          //       icon: Icon(Icons.edit),
                          //     ),

                          //     // delete button
                          //     IconButton(
                          //       onPressed: () => deleteNote(note.id),
                          //       icon: Icon(Icons.delete),
                          //     )
                          //   ],
                          // ),
