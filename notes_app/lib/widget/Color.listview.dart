import 'package:flutter/material.dart';
import 'package:notes_add/cubit/notecubit/notecubit.dart';
import 'package:notes_add/widget/Coloritem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorListview extends StatefulWidget {
  const ColorListview({super.key});

 
  @override
  State<ColorListview> createState() => _ColorListviewState();
}

class _ColorListviewState extends State<ColorListview> {
  int isselectd = 0;
    List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.cyan,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    final selectedColor = BlocProvider.of<NoteCubit>(context).color;

    return SizedBox(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, i) {
            final currentColor = colors[i];
             final isActive = currentColor.value == selectedColor.value;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                 BlocProvider.of<NoteCubit>(context).color = currentColor;
                  isselectd = i;
                  setState(() {});
                },
                child: Coloritem(
                  color: colors[i],
                  isactive: isActive,
                ),
              ),
            );
          }),
    );
  }
}
