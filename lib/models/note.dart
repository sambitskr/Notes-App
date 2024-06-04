import "package:isar/isar.dart";

//this line is needed to generate file
//then run: dart run build_runner build
part 'note.g.dart';

@Collection()
class Note {
  Id id = Isar.autoIncrement;

  late String text;
  late String content;

  Note({
    required this.text,
    required this.content,
  });

  Note.empty()
      : text = '',
        content = '';
}
