import 'package:flutter/material.dart';

class ButtonAdd extends StatelessWidget {
  const ButtonAdd({super.key, this.onpressed, required this.title});
final void Function()? onpressed;
 final  String title;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:onpressed ,
      color: Colors.blueAccent,
      textColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child:  Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
