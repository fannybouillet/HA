import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happyanimal_app/screens/shelter_detail.dart';

import 'screens/donation.dart';
import 'screens/home_page.dart';
//TODO : Générer une liste de refuges
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home" : (context) => HomePage(),
        "/donation" : (context) => DonationPage(),
        "/shelter/detail" : (context) => ShelterDetail()
      },
      initialRoute: "/home",
    );
  }

}

