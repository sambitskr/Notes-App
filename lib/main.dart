import 'package:flutter/material.dart';
import 'package:piconote/models/note_database.dart';
import 'package:piconote/pages/notes_page.dart';
import 'package:piconote/theme/theme.dart';
import 'package:piconote/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  //initialize note isar database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  runApp(
    MultiProvider(
      providers: [
        // Note provider
        ChangeNotifierProvider(
          create: (context) => NoteDatabase(),
        ),
        // Theme Provider
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themedata,
      darkTheme: darkMode,
      home: const NotesPage(),
    );
  }
}
