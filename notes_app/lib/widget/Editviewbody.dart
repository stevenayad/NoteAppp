import 'package:flutter/material.dart';
import 'package:notes_add/Model/note_model.dart';
import 'package:notes_add/widget/formedit.dart';

class Editviewbody extends StatelessWidget {
  const Editviewbody({super.key, required this.note_model});
final Note_Model note_model;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: formEditview(note: note_model,),
    );
  }
}
