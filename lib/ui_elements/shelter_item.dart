

import 'package:flutter/material.dart';

class HomeElementItem extends StatelessWidget {
  final String name;
  final Image image;
  final Function buttonAction;

  final String secondaryText;

  const HomeElementItem({ this.name, this.image, this.buttonAction, this.secondaryText = "",

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
                    Container(
                      clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: image),
                    SizedBox(height: 8,),
                    Text(secondaryText,
                    style: Theme.of(context).textTheme.subtitle1,)
                  ],
                ),
              ),
            ),
          );


  }
}
