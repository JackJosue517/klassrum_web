import 'package:flutter/material.dart';
import 'package:klassrum_web/ui/components/navigation_drawer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        drawer: const CustomNavigationDrawer(),
        body: Center(
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/call-room');
                },
                child: const Text('Rejoindre la session'))));
  }
}
