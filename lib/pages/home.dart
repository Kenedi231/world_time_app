import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void navigateToChooseLocation() => Navigator.pushNamed(context, '/location');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FlatButton.icon(
              onPressed: navigateToChooseLocation,
              icon: Icon(Icons.edit_location), 
              label: Text('Edit location')
            ),
          ],
        ),
      ),
    );
  }
}