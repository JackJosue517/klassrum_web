import 'package:flutter/material.dart';
import 'package:klassrum_web/ui/pages/dashboard.dart';
import 'package:klassrum_web/ui/pages/welcome.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool _isLogged = true;

  @override
  Widget build(BuildContext context) {
    return _isLogged ? const DashboardPage() : const WelcomePage();
  }
}
