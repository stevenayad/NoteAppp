import 'package:flutter/widgets.dart';
import 'package:notes_add/Model/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_add/cubit/lovecubit/lovestate.dart';

class lovecubit extends Cubit<Lovestate> {
  lovecubit() : super(loveIntial());

  final GlobalKey<FormState> fromstate = GlobalKey();
  final TextEditingController title = TextEditingController();
  final TextEditingController context = TextEditingController();

  List<Note_Model> fav = [];

  addfav(Note_Model note) {
    fav.add(note);
    emit(lovesucess());
  }

  removefav(Note_Model note) {
    fav.remove(note);
    emit(lovesucess());
  }

void updateFavNote(Note_Model oldNote, Note_Model updatedNote) {
  final index = fav.indexOf(oldNote);
  if (index != -1) {
    fav[index] = updatedNote;
    emit(lovesucess());
  }
}


  List<Note_Model> favlist() {
    return fav;
  }
  int favcount() {
    return fav.length;
  }

  bool favcontains(Note_Model note) {
    return fav.contains(note);
  }
  
}
