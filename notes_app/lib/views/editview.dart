import 'package:flutter/material.dart';
import 'package:notes_add/Model/note_model.dart';
import 'package:notes_add/widget/Editviewbody.dart';

class Editview extends StatelessWidget {
  const Editview({super.key, required this.note_model});
  final Note_Model note_model;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Editviewbody(note_model: note_model,),
    );
  }
}