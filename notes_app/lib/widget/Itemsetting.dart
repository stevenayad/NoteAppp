import 'package:flutter/material.dart';
import 'package:notes_add/Model/Itemsetting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_add/cubit/Themecubit/ThemeCubit.dart';

class Itemsetting extends StatefulWidget {
  const Itemsetting(
      {super.key, required this.itemsetting, required this.isactive});
  final ItemsettingModel itemsetting;
  final bool isactive;

  @override
  State<Itemsetting> createState() => _ItemsettingState();
}

class _ItemsettingState extends State<Itemsetting> {
  bool isdark = false;

  @override
  Widget build(BuildContext context) {
    return widget.isactive
        ? SwitchListTile(
            secondary: Icon(
              widget.itemsetting.icon,
            ),
            title: Text(widget.itemsetting.title),
            value: isdark,
            onChanged: (value) {
              isdark = value;
              BlocProvider.of<Themecubit>(context).isdark(value);
              setState(() {});
            },
          )
        : ListTile(
            leading: Icon(
              widget.itemsetting.icon,
            ),
            title: Text(widget.itemsetting.title),
          );
  }
}
