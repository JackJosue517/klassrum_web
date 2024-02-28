import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klassrum_web/logic/blocs/auth/auth_bloc.dart';
import 'package:klassrum_web/ui/pages/dashboard_page.dart';
import 'package:klassrum_web/ui/pages/welcome.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    /*final uid = context.select<AuthSuccess, String>((AuthSuccess state) => state.userModel.uid);
    return uid.isNotEmpty ? const DashboardPage() : const WelcomePage();*/
    return const DashboardPage();
=======
    final user = (context.watch<AuthBloc>().state as AuthSuccess).userModel;
    return user.uid.isNotEmpty ? const DashboardPage() : const WelcomePage();
>>>>>>> 6980c21b43514eaecbcdd836e7a0b9fab8638886
  }
}
