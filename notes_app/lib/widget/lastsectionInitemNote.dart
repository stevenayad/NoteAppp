import 'package:flutter/material.dart';
import 'package:notes_add/Model/note_model.dart';
import 'package:notes_add/cubit/lovecubit/lovecubut.dart';
import 'package:notes_add/cubit/lovecubit/lovestate.dart';
import 'package:notes_add/views/editview.dart';
import 'package:notes_add/widget/customIcons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class lastsectionInitemNote extends StatelessWidget {
  const lastsectionInitemNote({super.key, required this.note});
  final Note_Model note;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<lovecubit, Lovestate>(
      builder: (context, state) {
        bool isfav = BlocProvider.of<lovecubit>(context).favcontains(note);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            customIcons(
              icon: isfav ? Icons.favorite : Icons.favorite_border,
              onTap: () {
                if (!isfav) {
                  BlocProvider.of<lovecubit>(context).addfav(note);
                } else {
                  BlocProvider.of<lovecubit>(context).removefav(note);
                }
              },
            ),
            customIcons(
              icon: Icons.edit,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Editview(
                              note_model: note,
                            )));
              },
            )
          ],
        );
      },
    );
  }
}
