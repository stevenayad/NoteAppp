import 'package:flutter/material.dart';
import 'package:notes_add/generated/l10n.dart';
import 'package:notes_add/widget/favviewbody.dart';

class Favouriteview extends StatelessWidget {
  const Favouriteview({super.key});

  @override
  Widget build(BuildContext context) {
    //List<Note_Model>  favouritelist  = BlocProvider.of<lovecubit>(context).fav;
    return  Scaffold(
       appBar: AppBar(title: Text(S.of(context).Favsection) ,),
       body:const Favviewbody(),
    );
  }
}