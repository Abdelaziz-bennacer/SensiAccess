import 'dart:async';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sensi_access/utils/const.dart';
import 'package:sensi_access/views/good_form.dart';
import '../widgets/app_drawer.dart';

class PageNavigationAuditive extends StatefulWidget {
  static const String routeName = '/nav_auditive';

  const PageNavigationAuditive({Key? key}) : super(key: key);

  @override
  State<PageNavigationAuditive> createState() => _PageNavigationAuditiveState();
}

class _PageNavigationAuditiveState extends State<PageNavigationAuditive> {
  late bool darkMode;
  dynamic savedThemeMode;
  late Icon icon;

  @override
  void initState() {
    super.initState();
    getCurrentTheme();
    darkMode = false;
    icon = const Icon(
      FontAwesomeIcons.eyeSlash,
      color: Colors.white,
      semanticLabel: 'Passez en thème invisible',
    );
  }

  Future getCurrentTheme() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode.toString() == 'AdaptiveThemeMode.dark') {
      setState(() {
        darkMode = true;
      });
    } else {
      setState(() {
        darkMode = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: kNavAuditiveTitle,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              getCurrentTheme();
              Timer(const Duration(milliseconds: 20), () {
                if (darkMode == true) {
                  setState(() {
                    AdaptiveTheme.of(context).setLight();
                    darkMode = false;
                    icon = const Icon(
                      FontAwesomeIcons.eyeSlash,
                      color: Colors.white,
                      semanticLabel: 'Passez en thème invisible',
                    );
                  });
                } else {
                  setState(() {
                    AdaptiveTheme.of(context).setDark();
                    darkMode = true;
                    icon = const Icon(
                      FontAwesomeIcons.eye,
                      color: Colors.white,
                      semanticLabel: 'Passez en thème visible',
                    );
                  });
                }
              });
            },
            icon: icon,
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Le but de ces mises en situation est de vous montrer la différence d'expérience utilisateur qu'offrent,"
                " à une personne atteinte de cessité visuelle, des contenus programmés de façon volontairement accessibles "
                "et des contenus pour lesquels aucune mesure particulière n'a été prise.",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "Activez VoiceOver ou TalkBack dans vos paramètres d'accessibilité, "
                  "passez l'application en mode invisible grâce au bouton en forme d'oeil barré situé en haut à droite dans la barre supérieure et débutez l'expérience.",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  children: [
                    const Text(
                      'Les formulaires',
                      semanticsLabel: 'Titre de section, les formulaires',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(border: Border.all()),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Formulaire non accessible',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(border: Border.all()),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, GoodForm.routeName);
                        },
                        child: const Text(
                          'Formulaire accessible',
                          semanticsLabel:
                              'Testez un exemple de formulaire accessible',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  children: [
                    const Text(
                      'Le déplacement du focus',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(border: Border.all()),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Exemple non accessible',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(border: Border.all()),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Exemple accessible',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
