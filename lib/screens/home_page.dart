import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:happyanimal_app/animals_list.dart';
import 'package:happyanimal_app/shelters_list.dart';
import 'package:happyanimal_app/theme.dart';

//Todo: https://undraw.co/search

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
                HomeSectionTitle(title: 'Contributions du jour', icon: Icons.today,),

                HomeTodayContribution(),
                Divider(),
                HomeSectionTitle(title: 'Faire un don', icon: Icons.play_arrow,),
                HomeVideo(),
                //Les refuges
                HomeSectionTitle(title: 'Les refuges', icon: Icons.home,),
                Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: SheltersList()),
                HomeSectionTitle(title: 'Les animaux', icon: Icons.pets,),
                Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: AnimalsList(collectionName: 'animals'))
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
              child: Text('1',
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
              style: Theme.of(context).textTheme.headline5.copyWith(
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

        Image.network(
          'https://www.sortiraparis.com/images/80/62403/420603-paris-animal-show-2019-a-la-porte-de-versailles.jpg',
          width: 200,
        ),
        Text('Blabla')
      ],
    );
  }
}


/**

    **/