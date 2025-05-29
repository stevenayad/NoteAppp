import 'package:flutter/material.dart';

import 'package:notes_add/cubit/notecubit/notecubit.dart';
import 'package:notes_add/generated/l10n.dart';
import 'package:notes_add/widget/customIcons.dart';
import 'package:notes_add/widget/customsearchdelgate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.keys});
  final GlobalKey<ScaffoldState> keys;
  @override
  Widget build(BuildContext context) {
    final notes = BlocProvider.of<NoteCubit>(context).notes;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customIcons(
          icon: Icons.menu,
          onTap: () {
            keys.currentState!.openDrawer();
          },
        ),
         Text(
          S.of(context).notes,
          style: const TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        customIcons(
          onTap: () {
            showSearch(
              context: context,
              delegate: CustomSearch(notes: notes),
            );
          },
          icon: Icons.search,
        ),
      ],
    );
  }
}
