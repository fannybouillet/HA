import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:happyanimal_app/ui_elements/home_element_item.dart';

class AlertsList extends StatelessWidget {
  final String collectionName;

  const AlertsList({Key key, this.collectionName}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    CollectionReference alerts = FirebaseFirestore.instance.collection(collectionName);

    return StreamBuilder<QuerySnapshot>(
      stream: alerts.snapshots(),
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

        //buttonText: 'Voir tous les animaux',
        if(snapshot.hasData) {
          if(snapshot.data != null && snapshot.data.docs.length > 0) {
            return ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data.docs.map((e) {
                  return HomeElementItem(
                    image: Image.network(e.get('image'),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,),
                    name: e.get('name').substring(0,13)+"...",
                    buttonAction: () => Navigator.pushNamed(context, '/donation'),
                    secondaryText: e.get('description').substring(0,100)+"..."
                  );
                }).toList()
            );
          }
        }
            return Text("Une erreur est survenue");

      },
    );

  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('collectionName', collectionName));
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