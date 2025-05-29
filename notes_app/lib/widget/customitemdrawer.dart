import 'package:flutter/material.dart';
import 'package:notes_add/Model/item_drawer.dart';

class Customitemdrawer extends StatelessWidget {
  const Customitemdrawer({super.key, required this.itemDrawer});
  final ItemDrawer itemDrawer;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: itemDrawer.funtion,
      child: ListTile(
        leading: itemDrawer.icon,
        title: Text(itemDrawer.title),
      ),
    );
  }
}
