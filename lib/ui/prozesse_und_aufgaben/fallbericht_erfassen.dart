import 'package:cirs_app/ui/prozesse_und_aufgaben/prozesse_und_aufgaben.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FallBerichtPage extends StatefulWidget {
  @override
  _FallBerichtPageState createState() => _FallBerichtPageState();
}

class _FallBerichtPageState extends State<FallBerichtPage> {

  // Creates a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fallbericht erfassen'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline), //shows information icon on app bar
              onPressed: () {
                _infoButtonPressed(context); // show information icon pop-up message
              })
        ],
      ),
      body: Form(
        // Build a Form widget using the _formKey created above.
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Bitte Fall erfassen!', border: new OutlineInputBorder(borderRadius: new BorderRadius.vertical())
                ),
                textAlign: TextAlign.center,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Feld ist leer!';
                  }
                  return null;
                },
              ),

            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  //show pop-up message
                  savedAlert(context);
                }
              },
              child: Text('Abgeben ohne Analyse'),
              color: Colors.blue,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
            ),

            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  navigateToProcesses(context); //navigate to processes and task page
                }
              },
              child: Text('Abgeben und Analyse durchführen'),
              color: Colors.blue,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
            )
          ],
        ),
      ),
    );
  }

  Future<void> savedAlert(BuildContext context) {
    //creates pop-up message
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

  Future navigateToProcesses(context) async {
    //navigates to processes and task page
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProzesseUndAufgaben()));
  }
}

Future<void> _infoButtonPressed(BuildContext context) {
  //creates information icon pop-up message
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Wichtige Info'),
        content: const Text(
            "Was passiert wenn ich ein Fallbericht analysiere oder nicht analsysiere?"),
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
