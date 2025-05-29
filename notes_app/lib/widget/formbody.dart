import 'package:flutter/material.dart';
import 'package:notes_add/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_add/cubit/notecubit/notecubit.dart';
import 'package:notes_add/cubit/notecubit/notestate.dart';
import 'package:notes_add/generated/l10n.dart';
import 'package:notes_add/views/note_view.dart';
import 'package:notes_add/widget/form.dart';

class Formbody extends StatelessWidget {
  const Formbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Kdefaultpadding),
      child: BlocListener<NoteCubit, Notestate>(
        listener: (context, state) {
          if (state is Notesucess) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NoteVewBody()));
          } else if (state is NoteFaliure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(S.of(context).FillALLFields)),
            );
          }
        },
        child: const form(),
      ),
    );
  }
}
