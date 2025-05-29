import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_add/cubit/notecubit/notecubit.dart';
import 'package:notes_add/views/form_view.dart';
import 'package:notes_add/widget/customIcons.dart';
import 'package:notes_add/widget/drawer.dart';
import 'package:notes_add/widget/note_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteVewBody extends StatelessWidget {
  const NoteVewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var notecubit = BlocProvider.of<NoteCubit>(context);
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
      key: key,
      drawer: const customDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          notecubit.title.text = '';
          notecubit.contextt.text = '';
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const FormView(),
            ),
          );
        },
        child: const customIcons(icon: Icons.add),
      ),
      body: NoteView(
        keys: key,
      ),
    );
  }
}
