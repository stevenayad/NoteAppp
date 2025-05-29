import 'package:flutter/material.dart';
import 'package:notes_add/Model/note_model.dart';
import 'package:notes_add/constant.dart';
import 'package:notes_add/cubit/notecubit/notecubit.dart';
import 'package:notes_add/generated/l10n.dart';
import 'package:notes_add/widget/AddButton.dart';
import 'package:notes_add/widget/Color.listview.dart';
import 'package:notes_add/widget/customformfeild.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class formEditview extends StatefulWidget {
  const formEditview({super.key, required this.note});

  final Note_Model note;

  @override
  State<formEditview> createState() => _formEditviewState();
}

class _formEditviewState extends State<formEditview> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.subtitle);
    final noteCubit = BlocProvider.of<NoteCubit>(context, listen: false);
    noteCubit.color = Color(widget.note.color);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    /*final noteCubit = BlocProvider.of<NoteCubit>(context, listen: false);
    noteCubit.color = Colors.red;*/
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notecubit = BlocProvider.of<NoteCubit>(context);

    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.all(Kdefaultpadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                S.of(context).Edityournote,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              CustomFormField(
                controller: _titleController,
                label: S.of(context).title,
              ),
              const SizedBox(height: 12),
              CustomFormField(
                controller: _contentController,
                label: S.of(context).title,
                maxline: 3,
              ),
              const SizedBox(height: 24),
              const ColorListview(),
              const SizedBox(height: 24),
              ButtonAdd(
                title: S.of(context).Save,
                onpressed: () {
                  if (_formKey.currentState!.validate()) {
                    notecubit.title.text = _titleController.text;
                    notecubit.contextt.text = _contentController.text;

                    notecubit.editNote(widget.note, context);
                    Navigator.of(context).pop();
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
