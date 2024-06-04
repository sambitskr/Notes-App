import 'package:flutter/material.dart';
import 'package:piconote/components/noteSettings.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final Function()? onDeletePressed;
  const NoteTile({super.key, required this.text, this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(7),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: EdgeInsets.only(left: 25, right: 25, top: 10),
      child: ListTile(
          title: Text(text),
          trailing: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () => showPopover(
                  height: 100,
                  width: 100,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  context: context,
                  bodyBuilder: (context) => NoteSettings(
                        onDeleteTap: onDeletePressed,
                      )),
            ),
          )),
    );
  }
}
