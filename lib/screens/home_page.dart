import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:happyanimal_app/alerts_list.dart';
import 'package:happyanimal_app/animals_list.dart';
import 'package:happyanimal_app/shelters_list.dart';
import 'package:happyanimal_app/theme.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //contributions du jour
                HomeSectionTitle(title: 'Contributions du jour', icon: Icons.today,),
                HomeTodayContribution(),
                Divider(height: 30),
                //faire un don
                HomeSectionTitle(title: 'Faire un don', icon: Icons.play_arrow,),
                SizedBox(height: 8,),
                HomeVideo(),
                Divider(height: 30),
                //Les refuges
                HomeSectionTitle(title: 'Les refuges', icon: Icons.home,),
                Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child:
                    SheltersList()),
                MaterialButton(
                    child: Text('Voir tous les refuges'),
                    color: kHaBlueLight,
                    onPressed: () {
                      Navigator.pushNamed(context, '/list_shelters');
                    }),
                Divider(height: 30),
                HomeSectionTitle(title: 'Les animaux', icon: Icons.pets,),
                Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: AnimalsList(collectionName: 'animals')),
                MaterialButton(
                    child: Text('Voir tous les animaux'),
                    color: kHaBlueLight,
                  onPressed: null
                ),
                Divider(height: 30),
                //Les alertes
                //TODO contenir les alertes dans une carte de 200de large
                HomeSectionTitle(title: 'Les alertes', icon: Icons.warning,),
                Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: AlertsList(collectionName: 'alerts')),
                MaterialButton(
                    child: Text('Voir toutes les alertes'),
                    color: kHaBlueLight,
                    onPressed: null
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// factorisation des titres
class HomeSectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  const HomeSectionTitle({
    Key key, this.icon, this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon,
          color: kHaBlueLight,
          size: 18,
        ),
        SizedBox(width: 5,),
        Text(title,
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 12,)
      ],
    );
  }
}
// factorisation des contributions du jour
class HomeTodayContribution extends StatelessWidget {
  const HomeTodayContribution({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('images/dogo_7.png'),
            width: 90,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text('3',
                style: Theme.of(context).textTheme.headline1.copyWith(
                  color: Theme.of(context).accentColor
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nombre de repas ",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold
                ),
            ),
            Text("que vous avez apport??",
                style: Theme.of(context).textTheme.subtitle1
            ),
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text("325",
              style: Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 4,),
            Text("repas apport??s par la communaut??")
          ],
        )
      ],
    );
  }
}
//section vid??o
class HomeVideo extends StatefulWidget {
  @override
  _HomeVideoState createState() => _HomeVideoState();
}
class _HomeVideoState extends State<HomeVideo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // regarder une vid??o
      children: [
        Text('Apportez 1 repas simplement en regardant une vid??o'),
        //sVgX1j6E0Bo
    //TODO : ins??rer une vid??o
        SizedBox(height: 8,),
        Image.network(
          'https://www.30millionsdamis.fr/uploads/pics/hericourt-sauvetage-chat-grille-1171-player.jpg',
          width: 400,
        ),
        SizedBox(height: 8,),
        Text( "Faites un micro-don sans toucher ?? votre porte-monnaie ! Regardez et cliquez sur la vid??o : le publicitaire nous r??mun??rera quelques centimes, que nous reverserons en majorit?? aux refuges les plus dans le besoin."),
        SizedBox(height: 12,),
        Text("Si vous n'avez pas le temps de regarder une vid??o :"),
        SizedBox(height: 8,),
        MaterialButton(
          child: Text('Faites un don mon??taire'),
          color: kHaBlueLight,
          onPressed: () {
          Navigator.pushNamed(context, '/donation');
          })
      ],
    );
  }
}


/**

    **/