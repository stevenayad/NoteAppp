import 'package:flutter/material.dart';
import 'package:notes_add/Model/note_model.dart';
import 'package:notes_add/constant.dart';
import 'package:notes_add/cubit/notecubit/notecubit.dart';
import 'package:notes_add/cubit/notecubit/notestate.dart';
import 'package:notes_add/widget/noteitem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class notecontent extends StatelessWidget {
  const notecontent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, Notestate>(builder: (context, state) {
      List<Note_Model> notes = BlocProvider.of<NoteCubit>(context).notes ?? [];
      if (notes.isEmpty) {
        return const Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: Text(
            'No notes yet!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.cyan,
              fontStyle: FontStyle.italic,
              letterSpacing: 1.2,
            ),
          ),
        );
      } else if (state is Notesucess || notes.isNotEmpty) {
        return Expanded(
          child: GridView.builder(
            itemCount: notes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 240,
                mainAxisSpacing: Kdefaultpadding,
                crossAxisSpacing: Kdefaultpadding,
                childAspectRatio: 0.8),
            itemBuilder: (context, index) {
              return NoteItem(
                note: notes[index],
              );
            },
          ),
        );
      } else {
        return const Text(" ");
      }
    });
  }
}
