import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_add/cubit/Languagecubit/languagecubit.dart';
import 'package:notes_add/generated/l10n.dart';

class ShowbottomsheetBody extends StatefulWidget {
  const ShowbottomsheetBody({super.key});

  @override
  State<ShowbottomsheetBody> createState() => _ShowbottomsheetBodyState();
}

class _ShowbottomsheetBodyState extends State<ShowbottomsheetBody> {
  int ontap = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.25,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                String er = BlocProvider.of<Langcubit>(context).arbic;
                BlocProvider.of<Langcubit>(context).ischange(er);
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).Arabic,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                String er = BlocProvider.of<Langcubit>(context).english;
                BlocProvider.of<Langcubit>(context).ischange(er);

                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).English,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
