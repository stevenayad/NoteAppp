import 'package:flutter/material.dart';
import 'package:notes_add/generated/l10n.dart';
import 'package:notes_add/widget/customitemdrawersection.dart';

class customDrawer extends StatelessWidget {
  const customDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Drawer(
        child: Container(
          height: height,
          width: width * 0.2,
          decoration: const BoxDecoration(
            color: Colors.blueGrey,
          ),
          child:  Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Text(S.of(context).noteapp),
             const  customitemDrawersection(),
            ],
          ),
        ),
      ),
    );
  }
}
