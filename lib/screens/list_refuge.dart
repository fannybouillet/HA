//TODO afficher la liste des refuges de la bdd sous forme de card
// TODO possibilité de cliquer pour plus de détails
//TODO pouvoir filtrer selon dropdown des départements

import 'package:flutter/material.dart';

class ListShelter extends StatefulWidget {
  @override
  _ListShelterState createState() => _ListShelterState();
}

class _ListShelterState extends State<ListShelter> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "name",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text('image'),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "secondaryText",
                style: Theme.of(context).textTheme.subtitle1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
