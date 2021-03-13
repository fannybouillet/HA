import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15.0),
                height: 100,
                color: Colors.blue,
                child: Text('container1'),
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                height: 100,
                color: Colors.red,
                child: Text('container2'),
              )

            ],
          ),
        ),
        ),
    );
  }

}
