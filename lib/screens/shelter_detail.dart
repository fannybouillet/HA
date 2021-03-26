import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class ShelterDetailArguments {
  final String documentId;

  ShelterDetailArguments(this.documentId);
}

class ShelterDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ShelterDetailArguments args = ModalRoute.of(context).settings.arguments;
    final shelters = FirebaseFirestore.instance.collection('shelters');
    return FutureBuilder<DocumentSnapshot>(
      future: shelters.doc(args.documentId).get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Une erreur s'est produite");
        }

        if (snapshot.connectionState == ConnectionState.done) {

          return Scaffold(
            appBar: AppBar(
                title:Text(snapshot.data.get('name'))),
            body: Padding(
              padding: const EdgeInsets.all(8.0),

              child:
                ListView(
                  // This next line does the trick.
                    scrollDirection: Axis.vertical,
                                      children: [
                  Text(snapshot.data.get('name'),
                    style: Theme.of(context).textTheme.headline6,),
                  SizedBox(height: 8,),
                  Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: Image.network(snapshot.data.get('image')),height: 300,),
                 Row(
                   children: [
                     MaterialButton(
                         child: Text('Certifier le refuge'),
                         color: kHaBlueLight,
                         onPressed: null
                     ),
                     MaterialButton(
                         child: Text('Faire un don à ce refuge'),
                         color: kHaBlueLight,
                        onPressed: () {
                         Navigator.pushNamed(context, '/donation');
                       },
                     ),
                   ],
                 ),
                  SizedBox(height: 8,),
                  Text('Notre refuge'),
                  Text(snapshot.data.get('description'),
                    style: Theme.of(context).textTheme.caption,),
                  SizedBox(height: 8,),
                  Text('Conditions de visite'),
                  Text(snapshot.data.get('conditionVisit'),
                    style: Theme.of(context).textTheme.caption,),
                  SizedBox(height: 8,),
                  Text('Notre adresse'),
                  Text(snapshot.data.get('name'),
                    style: Theme.of(context).textTheme.caption,),
                  Text(snapshot.data.get('adress'),
                    style: Theme.of(context).textTheme.caption,),
                  Row(
                    children: [
                      Text(snapshot.data.get('zipcode'),
                        style: Theme.of(context).textTheme.caption,),
                      SizedBox(width: 2),
                      Text(snapshot.data.get('city'),
                        style: Theme.of(context).textTheme.caption,),
                    ],
                  ),

                  SizedBox(height: 8,),
                  Text('Pour nous contacter'),
                  Text(snapshot.data.get('phone'),
                    style: Theme.of(context).textTheme.caption,),
                  Text(snapshot.data.get('mail'),
                    style: Theme.of(context).textTheme.caption,),



                ],
              ),
            ),
          );
        }

        return Text("loading");
      },
    );
  }
}
