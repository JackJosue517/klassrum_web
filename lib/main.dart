import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klassrum_web/data/dataproviders/auth_provider.dart';
import 'package:klassrum_web/data/repositories/auth_repository.dart';
import 'package:klassrum_web/logic/blocs/auth/auth_bloc.dart';
import 'package:klassrum_web/secrets.dart';
import 'package:klassrum_web/ui/router/app_router.dart';
import 'package:klassrum_web/ui/configs/themes.dart';
import 'package:klassrum_web/ui/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // You may set the permission requests to "provisional" which allows the user to choose what type
// of notifications they would like to receive once the user receives a notification.
  final notificationSettings =
      await FirebaseMessaging.instance.requestPermission(provisional: true);

  final fcmToken = await FirebaseMessaging.instance
      .getToken(vapidKey: notifications["publicKey"]);
  print(fcmToken);

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
