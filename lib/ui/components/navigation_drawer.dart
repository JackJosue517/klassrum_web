import 'package:flutter/material.dart';
import 'package:klassrum_web/ui/configs/styles.dart';
import 'package:line_icons/line_icons.dart';

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
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed('/settings');
          },
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
                  style: AppText.headline5
                      .copyWith(color: AppColors.trueWhiteColor),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(LineIcons.home),
              title: const Text('Accueil'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/home'),
            ),
            ListTile(
              leading: const Icon(Icons.workspaces_outline),
              title: const Text('Workflow'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.update),
              title: const Text('Mises à jour'),
              onTap: () {},
            ),
            const Divider(color: Colors.black54),
            ListTile(
              leading: const Icon(Icons.account_tree_outlined),
              title: const Text('Plugins'),
              onTap: () {},
            ),
            ListTile(
                leading: const Icon(Icons.notifications_outlined),
                title: const Text('Notifications'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed('/notifications');
                }),
          ],
        ),
      );
}
