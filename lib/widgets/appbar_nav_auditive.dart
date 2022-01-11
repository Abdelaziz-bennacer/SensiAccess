import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sensi_access/utils/const.dart';

class AppBarNavAuditive extends StatefulWidget {
  const AppBarNavAuditive({Key? key}) : super(key: key);

  @override
  State<AppBarNavAuditive> createState() => _AppBarNavAuditiveState();
}

class _AppBarNavAuditiveState extends State<AppBarNavAuditive> {
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
    return AppBar(
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
                    semanticLabel: 'Passez en thème invisible',
                  );
                });
              }
            });
          },
          icon: icon,
        ),
      ],
    );
  }
}
