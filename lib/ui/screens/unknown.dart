import 'package:flutter/material.dart';
import 'package:klassrum_web/ui/components/go_back_button.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Erreur'),
          leading: const GoBackButton(),
        ),
        body: const Center(
          child: Text("Vous tentez d'accéder à une route non implémentée !!!"),
        ));
  }
}
