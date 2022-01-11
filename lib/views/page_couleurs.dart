import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sensi_access/utils/const.dart';
import 'package:sensi_access/widgets/app_drawer.dart';

class PageCouleurs extends StatefulWidget {
  static const String routeName = '/page_couleurs';

  const PageCouleurs({Key? key}) : super(key: key);

  @override
  _PageCouleursState createState() => _PageCouleursState();
}

class _PageCouleursState extends State<PageCouleurs> {
  late bool daltonMode;
  late Color greenButton;

  @override
  void initState() {
    super.initState();
    daltonMode = false;
    greenButton = Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: kPageCouleurTitle,
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    if (daltonMode ==
                        false) /*{
                      setState(() {
                        greenButton = Colors.green;
                        daltonMode = false;
                      });
                    } else*/
                    {
                      setState(() {
                        greenButton = Colors.red;
                        daltonMode = true;
                      });
                    }
                  },
                  child: const Text(
                    'Simulation 1',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(greenButton),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (daltonMode ==
                        false) /*{
                      setState(() {
                        greenButton = Colors.green;
                        daltonMode = false;
                      });
                    } else*/
                    {
                      setState(() {
                        greenButton = Colors.yellow;
                        daltonMode = true;
                      });
                    }
                  },
                  child: const Text(
                    'Simulation 2',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(greenButton),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (daltonMode ==
                        false) /*{
                      setState(() {
                        greenButton = Colors.green;
                        daltonMode = false;
                      });
                    } else*/
                    {
                      setState(() {
                        greenButton = Colors.blue;
                        daltonMode = true;
                      });
                    }
                  },
                  child: const Text(
                    'Simulation 3',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(greenButton),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: TextButton(
              onPressed: () {
                if (daltonMode == true) {
                  setState(() {
                    greenButton = Colors.green;
                    daltonMode = false;
                  });
                } /*else {
                  setState(() {
                    greenButton = Colors.blue;
                    daltonMode = true;
                  });
                }*/
              },
              child: const Text(
                'Normal',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
            ),
          ),
          Container(
            color: greenButton,
            width: 100,
            child: const Text('exemple'),
          ),
        ],
      ),
    );
  }
}
