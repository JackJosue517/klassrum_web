import 'package:flutter/material.dart';
import 'package:klassrum_web/ui/components/navigation_drawer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomNavigationDrawer(),
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
    );
  }
}
