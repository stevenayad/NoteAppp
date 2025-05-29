import 'package:flutter/material.dart';
import 'package:notes_add/widget/settingview_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: const SettingviewBody());
  }
}
