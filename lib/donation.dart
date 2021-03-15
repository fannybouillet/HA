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
                Column(children: [
                  //Titre et texte introductif
                  Text('Faire un don monétaire'),
                  Text(
                      "95% de nos dépenses sont dédiées aux bien être des animal. Cela comprend la nourriture, les soins, le besoin d'affection..."
                      "Les 5% restants sont nécessaires pour nos frais de gestion dont cette application"),
                  //montant des dons. On ne peut entrer que des chiffres
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Montant du don en euros'),
                  ),
                  // texte qui apparait si montant rempli et affiche 66% du montant à la place du X
                  Text(
                      'Votre don ne vous coûte réellement que X € après réduction fiscale.')
                ]),
                // formulaire
                TextFormField(
                  decoration: InputDecoration(labelText: 'Votre nom prénom*'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Votre adresse*'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Votre e-mail*'),
                ),
                Text(
                    '* Ces informations sont nécessaires pour vous transmettre votre reçu fiscal'),
                //récurrence de paiement. Selon le radio coché les boutons sont disable ou non
                Column(
                  children: [

                    Text('Récurence de paiement'),
                    ListTile(
                        title: const Text('Unique'),
                        leading: Radio(value: 'unique',groupValue: 'groupValue' , ),
                    ),
                    ListTile(
                        title: const Text('Mensuel'),
                        leading: Radio(value: 'monthly',groupValue: 'groupValue' ,)),
                    ListTile(
                        title: const Text('Annuel'),
                        leading: Radio(value: 'yearly',groupValue: 'groupValue' ,)),
                  ],
                ),
                MaterialButton(
                    onPressed: null, child: Text('Paypal'), color: Colors.blue),
                MaterialButton(
                    onPressed: null,
                    child: Text('Carte bancaire'),
                    color: Colors.blue),
                MaterialButton(
                    onPressed: null,
                    child: Text('Prélèvement SEPA'),
                    color: Colors.red)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
