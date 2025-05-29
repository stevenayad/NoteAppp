import 'package:flutter/material.dart';

class Dropdownlist extends StatefulWidget {
  const Dropdownlist({super.key, required this.list, required this.hint, required this.onChanged,required this.valuechoose});
  final List<String> list;
  final String hint;
  final  void Function(String?)? onChanged;
  final    String? valuechoose;
  @override
  State<Dropdownlist> createState() => _DropdownlistState();
}

class _DropdownlistState extends State<Dropdownlist> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value:widget.valuechoose,
          hint: Text(
            widget.hint,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          items: widget.list.map((valueItem) {
            return DropdownMenuItem<String>(
              value: valueItem,
              child: Text(
                valueItem,
                style: const TextStyle(fontSize: 16),
              ),
            );
          }).toList(),
          onChanged: widget.onChanged ,
          icon: const Icon(Icons.arrow_drop_down),
          isExpanded: true,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          dropdownColor: Colors.white,
        ),
      ),
    );
  }
}
