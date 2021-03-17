import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:happyanimal_app/ui_elements/shelter_item.dart';

import 'screens/shelter_detail.dart';

class SheltersList extends StatelessWidget {

  const SheltersList({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    CollectionReference shelters = FirebaseFirestore.instance.collection('shelters');

    return StreamBuilder<QuerySnapshot>(
      stream: shelters.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError){
            return Text('Erreur lors du chargement des données');
          }

          if(snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if(!snapshot.hasData){
            return Text('Pas de données');
          }

          //buttonText: 'Voir tous les refuges',
          if(snapshot.hasData) {

              return ListView(
                scrollDirection: Axis.horizontal,
                  children: snapshot.data.docs.map((e) {
                    return HomeElementItem(
                      image: Image.network(e.get('image'),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,),
                      name: e.get('name'),
                      buttonAction:  () => Navigator.pushNamed(
                          context,
                          '/shelter/detail',
                          arguments: ShelterDetailArguments(e.id)
                      ),
                      secondaryText: "${e.get('city')} ${e.get('adress')}",
                    );
                  }).toList()
              );

          }

          return Text("Hello");

      },
    );

  }
}

/**
    ShelterItem(
    image:  Image.network(document.data()['image'],
    fit:BoxFit.cover,
    width: 200,
    ),
    name: document.data()['name'],
    buttonAction: () { Navigator.pushNamed(context, '/donation'); }
    ),
    **/