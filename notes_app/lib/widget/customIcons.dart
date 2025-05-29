import 'package:flutter/material.dart';

class customIcons extends StatelessWidget {
  const customIcons({super.key, required this.icon, this.onTap});
  final IconData icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(12)),
        child: Icon(
          icon,
          size: 26,
        ),
      ),
    );
  }
}
