import 'package:flutter/material.dart';
import 'package:klassrum_web/ui/configs/styles.dart';
import 'package:line_icons/line_icons.dart';
import 'package:linkwell/linkwell.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late PageController _pageController;
  final _pages = const [
    Text('1'),
    Text('2'),
    Text('3'),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

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
                onPressed: () {},
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
    return Expanded(
      flex: 1,
      child: Container(
        child: Column(
          children: [
            PageView.builder(
                itemCount: _pages.length,
                itemBuilder: ((context, index) => Image.network(
                    'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'))),
            PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: _pages,
            ),
            //SmoothPageIndicator(
            //   controller: _pageController, count: _pages.length),
          ],
        ),
      ),
    );
  }
}
