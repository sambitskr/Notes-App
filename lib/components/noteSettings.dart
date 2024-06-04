import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  final void Function()? onDeleteTap;
  const NoteSettings({super.key, this.onDeleteTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // delete
        GestureDetector(
          onTap: () {
            onDeleteTap!();
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: Text(
                'Delete',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
          ),
        )
      ],
    );
  }
}
