import 'package:flutter/material.dart';
import 'package:klassrum_web/ui/configs/styles.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildHeader(context),
        buildMenuItems(context),
      ],
    )));
  }

  Widget buildHeader(BuildContext context) => Material(
        color: AppColors.primaryColor,
        child: Container(
          padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'M. HOETOWOU Yaovi',
                style: AppText.headline3.copyWith(
                  color: AppColors.trueWhiteColor,
                ),
              ),
              Text(
                'gravatar@yahoo.fr',
                style:
                    AppText.headline5.copyWith(color: AppColors.trueWhiteColor),
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(Icons.dashboard_outlined),
              title: const Text('Dashboard'),
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed('/dashboard'),
            ),
            ListTile(
              leading: const Icon(Icons.book_online_outlined),
              title: const Text('Cours'),
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed('/course'),
            ),
            ListTile(
              leading: const Icon(Icons.update),
              title: const Text('Ressources'),
              onTap: () => Navigator.of(context).pushNamed("/ressource"),
            ),
            const Divider(color: Colors.black54),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Deconnexion'),
                onTap: () {
                  //action de deconnexion
                }),
          ],
        ),
      );
}
