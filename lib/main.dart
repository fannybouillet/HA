import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'home_page_row.dart';
//TODO : Générer une liste de refuges
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // barre d'application
        appBar: AppBar(
            title:Text('Happy Animal')),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  // regarder une vidéo
                  children: [
                    Text('Regarder une vidéo pour aider'),
                    Image.network(
                        'https://www.sortiraparis.com/images/80/62403/420603-paris-animal-show-2019-a-la-porte-de-versailles.jpg',
                        width: 200,
                    ),
                    Text('Blabla')
                  ],
                ),
                //Les refuges
                Text('Les refuges qui ont besoin de moi'),
              HomePageRow(buttonText: 'Voir tous les refuges',
                image:  Image.network('https://img-19.ccm2.net/8vUCl8TXZfwTt7zAOkBkuDRHiT8=/1240x/smart/b829396acc244fd484c5ddcdcb2b08f3/ccmcms-commentcamarche/20494859.jpg',
                  fit:BoxFit.cover,
                  width: 200,
                ),
                name: 'The XXX',),
              ],
            ),
          ),
        ),
        ),
    );
  }

}

