import 'package:flutter/material.dart';
import 'package:notes_add/Model/note_model.dart';
import 'package:notes_add/constant.dart';
import 'package:notes_add/widget/noteitem.dart';

class CustomSearch extends SearchDelegate {
  final List<Note_Model>? notes;
  static List<Note_Model> filternote = [];
  CustomSearch({
    super.searchFieldLabel,
    super.searchFieldStyle,
    super.searchFieldDecorationTheme,
    super.keyboardType,
    super.textInputAction,
    super.autocorrect,
    super.enableSuggestions,
    required this.notes,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("Search Results");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredNotes = notes
        ?.where((note) =>
            note.title.toLowerCase().contains(query.toLowerCase()) ||
            note.subtitle.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (query == '') {
      return const Text('');
    } else {
      return Padding(
        padding: const EdgeInsets.all(Kdefaultpadding),
        child: Expanded(
          child: GridView.builder(
            itemCount: filteredNotes?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 240,
                mainAxisSpacing: Kdefaultpadding,
                crossAxisSpacing: Kdefaultpadding,
                childAspectRatio: 0.8),
            itemBuilder: (context, index) {
              return NoteItem(
                note: filteredNotes![index],
              );
            },
          ),
        ),
      );
    }
  }
}
