import 'package:flutter/material.dart';
import 'package:klassrum_web/ui/components/go_back_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const GoBackButton(),
          title: const Text('Paramètres'),
        ),
        body: const Center(
          child: Text("Réglages"),
        ));
  }
}
