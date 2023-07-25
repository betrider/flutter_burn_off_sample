import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_30/model/aliments.dart';
import 'package:flutter_application_30/widgets/aliment.dart';
import 'package:flutter_application_30/widgets/card_item.dart';
import 'package:flutter_application_30/widgets/page.dart';
import 'package:flutter_application_30/widgets/pager.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BurnOff',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MenuPager(
        children: Aliments.aliments
            .map(
              (e) => CustomPage(
                title: 'HOW TO BURN OFF',
                background: e.background!,
                icon: e.bottomImage!,
                child: CardItem(
                  child: AlimentWidget(
                    aliment: e,
                    theme: e.background!,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
