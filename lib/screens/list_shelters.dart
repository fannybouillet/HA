//TODO afficher la liste des refuges de la bdd sous forme de card
// TODO possibilité de cliquer pour plus de détails
//TODO pouvoir filtrer selon dropdown des départements

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:happyanimal_app/screens/shelter_detail.dart';
import 'package:happyanimal_app/ui_elements/element_list_shelters.dart';

import '../theme.dart';

class ListShelter extends StatefulWidget {
  @override
  _ListShelterState createState() => _ListShelterState();
}

class _ListShelterState extends State<ListShelter> {
  @override
  Widget build(BuildContext context) {
    CollectionReference shelters = FirebaseFirestore.instance.collection(
        'shelters');

    return Scaffold(
        backgroundColor: kHaBgYellow,
        // barre d'application
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.volunteer_activism),
          onPressed: () {
            Navigator.pushNamed(context, '/donation');
          },
        ),
        appBar: AppBar(
            title:Text('Happy Animal')),
        body: SafeArea(
        child:
        StreamBuilder<QuerySnapshot>(
      stream: shelters.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Erreur lors du chargement des données');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (!snapshot.hasData) {
          return Text('Pas de données');
        }

        //buttonText: 'Voir tous les refuges',
        if (snapshot.hasData) {
          return ListView(
              scrollDirection: Axis.vertical,
              children: snapshot.data.docs.map((e) {
                return ElementListShelter(
                  image: Image.network(e.get('image'),
                    width: 100 ,
                    height: 100,
                    fit: BoxFit.cover,),
                  name: e.get('name'),
                  buttonAction: () =>
                      Navigator.pushNamed(
                          context,
                          '/shelter/detail',
                          arguments: ShelterDetailArguments(e.id)
                      ),
                  zipcode: e.get('zipcode'),
                  city: e.get('city'),
                  adress: e.get('adress'),
                  departement: e.get('departement'),
                );

              }).toList()
          );
        }

        return Text("Hello");
      },
    ),
    ),
    );
  }
}
