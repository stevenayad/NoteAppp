import 'package:flutter/material.dart';
import 'package:notes_add/constant.dart';
import 'package:notes_add/cubit/notecubit/notecubit.dart';
import 'package:notes_add/widget/custom_appbar.dart';
import 'package:notes_add/widget/note_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key, required this.keys});
  final GlobalKey<ScaffoldState> keys;
  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).fetchnote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Kdefaultpadding),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomAppBar(
            keys: widget.keys,
          ),
          const SizedBox(
            height: 16,
          ),
          const notecontent(),
        ],
      ),
    );
  }
}
