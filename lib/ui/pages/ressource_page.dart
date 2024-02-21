import 'package:flutter/material.dart';
import 'package:klassrum_web/ui/components/navigation_drawer.dart';

class RessourcePage extends StatefulWidget {
  const RessourcePage({super.key});

  @override
  State<RessourcePage> createState() => _RessourcePageState();
}

class _RessourcePageState extends State<RessourcePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resssources'),
      ),
      drawer: const CustomNavigationDrawer(),
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}
