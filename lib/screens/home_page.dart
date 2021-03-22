import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:happyanimal_app/alerts_list.dart';
import 'package:happyanimal_app/animals_list.dart';
import 'package:happyanimal_app/shelters_list.dart';
import 'package:happyanimal_app/alerts_list.dart';
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
                Divider(),
                //faire un don
                HomeSectionTitle(title: 'Faire un don', icon: Icons.play_arrow,),
                HomeVideo(),
                Divider(),
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
                      Navigator.pushNamed(context, '/listRefuge');
                    }),

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

//Todo: mettre dans des fichiers différents

//Todo: Mettre les arguments
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
            Text("que vous avez apporté",
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
            Text("repas apportés par la communauté")
          ],
        )
      ],
    );
  }
}

class HomeVideo extends StatefulWidget {
  @override
  _HomeVideoState createState() => _HomeVideoState();
}
class _HomeVideoState extends State<HomeVideo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // regarder une vidéo
      children: [
        Text('Apportez 1 repas simplement en regardant une vidéo'),
        //sVgX1j6E0Bo
    //TODO : insérer une vidéo
        Image.network(
          'https://www.sortiraparis.com/images/80/62403/420603-paris-animal-show-2019-a-la-porte-de-versailles.jpg',
          width: 200,
        ),
        Text('Explication du concept, de ce qu apporte de regarder une vidéo'),
        SizedBox(height: 8,),
        Text("Si vous n'avez pas le temps de regarder une vidéo"),
        MaterialButton(
          child: Text('Faites un don monétaire'),
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