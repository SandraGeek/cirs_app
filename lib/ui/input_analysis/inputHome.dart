import 'package:cirs_app/ui/input_analysis/patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cirs_app/ui/input_analysis/probenmaterial.dart';

import 'info.dart';

class inputHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INPUT'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                _infoButtonPressed(context);
              })
        ],
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new MaterialButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: new Text("Information"),
              onPressed: () {
                navigateToInformation(context);
              },
            ),
            new MaterialButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: new Text("Patient"),
              onPressed: () {
                navigateToPatient(context);
              },
            ),
            new MaterialButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: new Text("Probenmaterial/Medikament"),
              onPressed: () {
                navigateToProbenmaterial(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Future navigateToProbenmaterial(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => probenmaterial()));
  }

  Future navigateToInformation(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => info()));
  }

  Future navigateToPatient(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => patient()));
  }

  Future<void> savedAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Vielen Dank!'),
          content: const Text(
              'Ein Feedback wird in den nächsten Tagen veröffentlicht.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _infoButtonPressed(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Wichtige Info'),
          content: const Text(
              "Bitte mindestens eine von den Komponenten ausfüllen!"),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
