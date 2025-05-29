import 'package:flutter/material.dart';
import 'package:notes_add/constant.dart';
import 'package:notes_add/cubit/notecubit/notecubit.dart';
import 'package:notes_add/generated/l10n.dart';
import 'package:notes_add/widget/AddButton.dart';
import 'package:notes_add/widget/Color.listview.dart';
import 'package:notes_add/widget/customformfeild.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var notecubit = BlocProvider.of<NoteCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(Kdefaultpadding),
      child: SingleChildScrollView(
        child: Form(
          key: key,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                S.of(context).Addyournote,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CustomFormField(
                controller: notecubit.title,
                label: S.of(context).title,
              ),
              const SizedBox(height: 12),
              CustomFormField(
                controller: notecubit.contextt,
                label: S.of(context).content,
                maxline: 3,
              ),
              const SizedBox(height: 24),
              const ColorListview(),
              const SizedBox(height: 24),
              ButtonAdd(
                title: S.of(context).Addnote,
                onpressed: () {
                  if (key.currentState!.validate()) {
                    BlocProvider.of<NoteCubit>(context).addNote();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
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
