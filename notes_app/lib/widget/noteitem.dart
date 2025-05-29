import 'package:flutter/material.dart';
import 'package:notes_add/Model/note_model.dart';
import 'package:notes_add/views/see_view.dart';
import 'package:notes_add/widget/lastsectionInitemNote.dart';
import 'package:notes_add/widget/topsectioninitemnote.dart';


class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final Note_Model note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SeeView(
                  note: note,
                )));
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopSectionInItemNote(
              note: note,
            ),
            const SizedBox(height: 8),
            Text(
              note.subtitle,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 24),
            Text(
              note.date,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(
              height: 12,
            ),
            lastsectionInitemNote(
              note: note,
            ),
          ],
        ),
      ),
    );
  }
}
