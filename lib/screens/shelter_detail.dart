import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(snapshot.data.get('name'),
                    style: Theme.of(context).textTheme.headline6,),
                  SizedBox(height: 8,),
                  Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: Image.network(snapshot.data.get('image'))),
                  SizedBox(height: 8,),
                  Text(snapshot.data.get('description'),
                    style: Theme.of(context).textTheme.caption,)
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
