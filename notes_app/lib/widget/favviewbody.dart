import 'package:flutter/material.dart';
import 'package:notes_add/constant.dart';
import 'package:notes_add/cubit/lovecubit/lovecubut.dart';
import 'package:notes_add/cubit/lovecubit/lovestate.dart';
import 'package:notes_add/widget/noteitem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favviewbody extends StatelessWidget {
  const Favviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<lovecubit, Lovestate>(builder: (context, state) {
      final notes = BlocProvider.of<lovecubit>(context).fav;
      if (notes.isEmpty) {
        return const Center(
          child: Text(
            'No notes Favourite yet!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.cyan,
              fontStyle: FontStyle.italic,
              letterSpacing: 1.2,
            ),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(Kdefaultpadding),
          child: GridView.builder(
            itemCount: notes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 240,
              mainAxisSpacing: Kdefaultpadding,
              crossAxisSpacing: Kdefaultpadding,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return NoteItem(
                note: notes[index],
              );
            },
          ),
        );
      }
    });
  }
}
