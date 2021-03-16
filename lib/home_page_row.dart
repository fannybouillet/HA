

import 'package:flutter/material.dart';

class HomePageRow extends StatelessWidget {
  final String name;
  final Image image;
  final String buttonText;

  const HomePageRow({ this.name, this.image, this.buttonText,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row (
                children:[
                  Column(
                    children: [
                      Text(name),
                      image
                    ],
                  )
                ]
            ),
          ),
          MaterialButton(
              child: Text(buttonText),
              onPressed: null)
        ]
    );
  }
}
