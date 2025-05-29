import 'package:flutter/material.dart';
import 'package:notes_add/widget/formbody.dart';

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Formbody(),
    );
  }
}