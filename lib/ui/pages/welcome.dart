import 'package:flutter/material.dart';
import 'package:klassrum_web/ui/configs/styles.dart';
import 'package:line_icons/line_icons.dart';
import 'package:linkwell/linkwell.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Klassrum'),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text('12:06 | mar. 20 févr.'),
            ),
          ],
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildDescriptive(context),
            buildIllustrations(context),
          ],
        ));
  }

  Widget buildDescriptive(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plateforme de cours en ligne modulaire',
              style: AppText.headlineA.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Klassrum permet d'organiser et de rejoindre facilement des sessions de cours en ligne sécurisées, sur n'importe quel appareil.",
              style: AppText.headline3.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Rejoignez l'aventure sans plus tarder...",
              style: AppText.headline5.copyWith(
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.trueWhiteColor,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
                icon: const Icon(LineIcons.stream),
                label: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Commencer',
                    style:
                        AppText.headline6.copyWith(fontWeight: FontWeight.bold),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.black45,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                //TODO: Launch this url
              },
              child: LinkWell(
                'En savoir plus sur klassrum3.web.app/about',
                listOfNames: const {
                  'klassrum3.web.app/about': 'Klassrum',
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIllustrations(BuildContext context) {
    //TODO: Implement the missed section for the welcome view
    //TODO: See the right section of https://meet.google.com
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
      ),
    );
  }
}