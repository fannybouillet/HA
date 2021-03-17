import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:happyanimal_app/animals_list.dart';
import 'package:happyanimal_app/shelters_list.dart';
import 'package:happyanimal_app/ui_elements/shelter_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // barre d'application
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
      ),
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
              Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: SheltersList()),
              Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: AnimalsList(collectionName: 'animals'))
            ],
          ),
        ),
      ),
    );
  }
}


/**

    **/