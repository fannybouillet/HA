

import 'package:flutter/material.dart';

class ElementListShelter  extends StatelessWidget {
  final String name;
  final Image image;
  final Function buttonAction;
  final String departement;
  final String city;
  final String adress;
  final String zipcode;

  const ElementListShelter({ this.name, this.image, this.buttonAction, this.departement = "",this.adress="",this.city="", this.zipcode="",

});

@override
Widget build(BuildContext context) {
  return
    GestureDetector(
      onTap: this.buttonAction,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                style: Theme.of(context).textTheme.headline6,),
              SizedBox(height: 8,),
              Row(
                children: [
                  Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: image),
                  SizedBox(height: 8,),
                  Column(
                    children: [
                      Text(adress,
                        style: Theme.of(context).textTheme.subtitle1,),
                      Row(
                        children:[
                          Text(zipcode,
                            style: Theme.of(context).textTheme.subtitle1,),
                          SizedBox(width: 2,),
                          Text(city,
                            style: Theme.of(context).textTheme.subtitle1,),

                        ]
                      ),
                      Text(departement,
                        style: Theme.of(context).textTheme.subtitle1,),

                    ],
                  ),



                ],
              )

            ],
          ),
        ),
      ),
    );


}
}
