import 'package:flutter/material.dart';
import 'package:notes_add/Model/note_model.dart';
import 'package:notes_add/cubit/lovecubit/lovecubut.dart';
import 'package:notes_add/cubit/notecubit/notecubit.dart';
import 'package:notes_add/widget/customIcons.dart' show customIcons;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class TopSectionInItemNote extends StatelessWidget {
  const TopSectionInItemNote({super.key, required this.note});

  final Note_Model note;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            note.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        customIcons(
          icon: Icons.delete,
          onTap: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.rightSlide,
              title: 'Delete Note?',
              desc: 'Are you sure you want to delete this note?',
              btnCancelOnPress: () {},
              btnOkOnPress: () {
                BlocProvider.of<NoteCubit>(context).removeNote(note);
                BlocProvider.of<lovecubit>(context).removefav(note);
              },
            )..show();
          },
        ),
      ],
    );
  }
}
