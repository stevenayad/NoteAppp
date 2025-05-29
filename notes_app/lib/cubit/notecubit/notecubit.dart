import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_add/Model/note_model.dart';
import 'package:notes_add/constant.dart';
import 'package:notes_add/cubit/lovecubit/lovecubut.dart';
import 'package:notes_add/cubit/notecubit/notestate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NoteCubit extends Cubit<Notestate> {
  NoteCubit() : super(NoteIntial());

  final TextEditingController title = TextEditingController();
  final TextEditingController contextt = TextEditingController();
  Color color = Colors.red;

  String dateo = DateFormat("yyyy-MM-dd").format(DateTime.now());

  addNote() {
    emit(Noteloading());
    try {
      var noteboxs = Hive.box<Note_Model>(Knotesbox);
      var note = Note_Model(
          title: title.text,
          subtitle: contextt.text,
          date: dateo,
          color: color.value);
      noteboxs.add(note);

      emit(Notesucess());
    } catch (e) {
      emit(NoteFaliure(errMessage: e.toString()));
    }
  }

  void editNote(Note_Model oldNote, BuildContext context) {
    final noteBox = Hive.box<Note_Model>(Knotesbox);
    final notesList = noteBox.values.toList();

    final index = notesList.indexOf(oldNote);

    if (index >= 0) {
      final key = noteBox.keyAt(index);

      final updatedNote = Note_Model(
        title: title.text,
        subtitle: contextt.text,
        date: dateo,
        color: color.value,
      );

      noteBox.put(key, updatedNote);

      BlocProvider.of<lovecubit>(context).updateFavNote(oldNote, updatedNote);

      fetchnote();
      emit(Notesucess());
    }
  }

  void removeNote(Note_Model note) {
    final noteBox = Hive.box<Note_Model>(Knotesbox);
    final notesList = noteBox.values.toList();

    final index = notesList.indexOf(note);

    if (index >= 0) {
      final keyToDelete = noteBox.keyAt(index);
      noteBox.delete(keyToDelete);
      fetchnote(); //if remove not work
      emit(Notesucess());
    }
  }

  List<Note_Model>? notes;
  fetchnote() {
    var noteboxs = Hive.box<Note_Model>(Knotesbox);
    notes = noteboxs.values.toList();
  }
}
