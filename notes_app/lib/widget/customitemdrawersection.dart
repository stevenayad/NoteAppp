import 'package:flutter/material.dart';
import 'package:notes_add/Model/item_drawer.dart';
import 'package:notes_add/generated/l10n.dart';
import 'package:notes_add/views/favouriteview.dart';
import 'package:notes_add/views/setting_view.dart';
import 'package:notes_add/widget/customitemdrawer.dart';

class customitemDrawersection extends StatelessWidget {
  const customitemDrawersection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Customitemdrawer(
            itemDrawer: ItemDrawer(
                title: S.of(context).Setting,
                icon: const Icon(Icons.settings),
                funtion: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingView()));
                })),
        Customitemdrawer(
          itemDrawer: ItemDrawer(
              title: S.of(context).Love,
              icon: const Icon(Icons.favorite),
              funtion: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Favouriteview()));
              }),
        )
      ],
    );
  }
}
