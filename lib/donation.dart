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
        appBar: AppBar(title: Text('Happy Animal')),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    Text('Faire un don monétaire'),
                    Text(
                        "95% de nos dépenses sont dédiées aux bien être des animal. Cela comprend la nourriture, les soins, le besoin d'affection..."
                            "Les 5% restants sont nécessaires pour nos frais de gestion dont cette application"),

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Montant du don en euros'),
                      ),
                      Text(
                          'Votre don ne vous coûte réellement que X € après réduction fiscale.')
                    ]),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Votre nom prénom*'),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Votre adresse*'),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Votre e-mail*'),
                ),
                    Text('* Ces informations sont nécessaires pour vous transmettre votre reçu fiscal'),
                    Text('Récurence de paiement'),
                    ListTile(
                        title: const Text('Unique'),
                        leading: Radio(value: 'Unique')),
                    ListTile(
                        title: const Text('Mensuel'),
                        leading: Radio(value: 'Mensuel')),
                    ListTile(
                        title: const Text('Annuel'),
                        leading: Radio(value: 'Annuel')),
                MaterialButton(onPressed: null,child: Text('Paypal'),color: Colors.blue),
                MaterialButton(onPressed: null,child: Text('Carte bancaire'),color: Colors.blue),
                MaterialButton(onPressed: null,child: Text('Prélèvement SEPA'),color: Colors.red)
                

              ],
            ),
          ),
        ),
      ),
    );
  }
}
