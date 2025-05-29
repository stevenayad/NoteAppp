import 'package:flutter/material.dart';
import 'package:notes_add/Model/note_model.dart';
import 'package:notes_add/widget/see_view_body.dart';

class SeeView extends StatelessWidget {
  const SeeView({super.key, required this.note});
  final Note_Model note;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SeeViewBody(
        note:note ,
      ),
    );
  }
}
