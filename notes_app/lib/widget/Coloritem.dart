import 'package:flutter/material.dart';

class Coloritem extends StatelessWidget {
  const Coloritem({super.key, required this.color, required this.isactive});

  final Color color;
  final bool isactive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
        border: isactive ? Border.all(color: Colors.black, width: 3) : null,
      ),
      width: 40,
      height: 40,
    );
  }
}


