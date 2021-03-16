import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

enum paymentType { unique, monthly, yearly }

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  double trueCost = 0;

  paymentType radioSelectedValue = paymentType.unique;

  void computeTrueCost(String text) {
    if (text == "") {
      setState(() {
        trueCost = 0;
      });
    }
    var enteredValue = double.parse(text);
    if (enteredValue != null) {
      setState(() {
        trueCost = enteredValue * 0.33;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Faire un don')),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    //Titre et texte introductif
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 24, left: 16, right: 16, bottom: 18),
                        child: Column(children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Faire un don monétaire',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          Divider(),
                          Text(
                              "95% de nos dépenses sont dédiées aux bien être des animal. Cela comprend la nourriture, les soins, le besoin d'affection..."
                              "Les 5% restants sont nécessaires pour nos frais de gestion dont cette application"),
                          SizedBox(
                            height: 18,
                          ),
                          //montant des dons. On ne peut entrer que des chiffres
                          TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can be entered
                            onChanged: (text) {
                              computeTrueCost(text);
                            },
                            decoration: InputDecoration(
                                labelText: 'Montant du don en euros'),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          // texte qui apparait si montant rempli et affiche 66% du montant à la place du X
                          //Todo: Arrondir la valeur affiché
                          Text(
                              'Votre don ne vous coûte réellement que $trueCost € après réduction fiscale.'),
                          // formulaire
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Votre nom prénom*'),
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Votre adresse*'),
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Votre e-mail*'),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                              '* Ces informations sont nécessaires pour vous transmettre votre reçu fiscal'),
                          SizedBox(height: 16,),
                          Row(
                            children: [
                              RadioLabelButton(
                                  groupValue: radioSelectedValue,
                                  label: 'Ponctuel',
                                  selectedValue: paymentType.unique,
                                  onChangeFunction: (paymentType value) {
                                    setState(() {
                                      radioSelectedValue = value;
                                    });
                                  }),
                              RadioLabelButton(
                                  groupValue: radioSelectedValue,
                                  label: 'Mensuel',
                                  selectedValue: paymentType.monthly,
                                  onChangeFunction: (paymentType value) {
                                    setState(() {
                                      radioSelectedValue = value;
                                    });
                                  }),
                              RadioLabelButton(
                                  groupValue: radioSelectedValue,
                                  label: 'Annuel',
                                  selectedValue: paymentType.yearly,
                                  onChangeFunction: (paymentType value) {
                                    setState(() {
                                      radioSelectedValue = value;
                                    });
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              radioSelectedValue == paymentType.unique ? MaterialButton(
                                  onPressed: () {}, child: Text('Paypal'), color: Colors.blue) : SizedBox(),
                              radioSelectedValue == paymentType.unique ? MaterialButton(
                                  onPressed: () {},
                                  child: Text('Carte bancaire'),
                                  color: Colors.blue) : SizedBox(),

                              radioSelectedValue != paymentType.unique ? MaterialButton(
                                  onPressed: () {

                                  },
                                  child: Text('Prélèvement SEPA'),
                                  color: Colors.amber) : SizedBox()
                            ],
                          )
                        ]),
                      ),
                    ),

                  ],
                ),
                //récurrence de paiement. Selon le radio coché les boutons sont disable ou non



              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RadioLabelButton extends StatelessWidget {
  final paymentType selectedValue;
  final String label;
  final paymentType groupValue;
  final Function onChangeFunction;

  const RadioLabelButton(
      {Key key,
      this.selectedValue,
      this.label,
      this.groupValue,
      this.onChangeFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
            value: selectedValue,
            groupValue: groupValue,
            onChanged: onChangeFunction),
        Text(label)
      ],
    );
  }
}
