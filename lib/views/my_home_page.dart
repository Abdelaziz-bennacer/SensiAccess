import 'package:flutter/material.dart';
import 'package:sensi_access/utils/const.dart';
import '../widgets/app_drawer.dart';

class MyHomePage extends StatelessWidget {
  static const String routeName = '/home';
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: kHomePageTitle,
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              child: const Text('Application'),
            ),
          ],
        ),
      ),
    );
  }
}
