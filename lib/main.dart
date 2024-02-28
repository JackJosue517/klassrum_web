import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klassrum_web/data/dataproviders/auth_provider.dart';
import 'package:klassrum_web/data/repositories/auth_repository.dart';
import 'package:klassrum_web/logic/blocs/auth/auth_bloc.dart';
import 'package:klassrum_web/ui/router/app_router.dart';
import 'package:klassrum_web/ui/configs/themes.dart';
import 'package:klassrum_web/ui/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AuthRepository(AuthDataProvider()),
      child: BlocProvider(
        create: (context) => AuthBloc(context.read<AuthRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Klassrum',
          onGenerateRoute: AppRouter.onGenerateRoute,
          theme: AppTheme.buildTheme(),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
