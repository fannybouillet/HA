import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/donation.dart';
import 'screens/home_page.dart';
//TODO : Générer une liste de refuges
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home" : (context) => HomePage(),
        "/donation" : (context) => DonationPage()
      },
      initialRoute: "/home",
    );
  }

}

