import 'package:flutter/material.dart';
import 'package:notes_add/Model/Itemsetting.dart';
import 'package:notes_add/generated/l10n.dart';
import 'package:notes_add/widget/Itemsetting.dart';
import 'package:notes_add/widget/showbottomsheet_body.dart';

class SettingviewBody extends StatelessWidget {
  const SettingviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.25,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    context: context,
                    builder: (context) {
                      return const ShowbottomsheetBody();
                    });
              },
              child: Itemsetting(
                isactive: false,
                itemsetting:
                    ItemsettingModel(title: S.of(context).Language, icon: Icons.language),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Itemsetting(
              isactive: true,
              itemsetting: ItemsettingModel(title: S.of(context).Theme, icon: Icons.mode),
            )
          ],
        ),
      ),
    );
  }
}
