import 'package:cirs_app/ui/input_analysis/patientHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'aufgabeDetails.dart';

class aufgabeHome extends StatefulWidget {
  @override
  _AufgabeHomeState createState() => _AufgabeHomeState();
}

class _AufgabeHomeState extends State<aufgabeHome> {
  /// This class shows the options needed to provide task data or not
  int _selected;

  void onPressed() {

    if(_selected == null){
      // shows second pop-up message in case no choice is made
      savedAlert2(context);
    }
    else if( _selected != 0){
      // shows pop-up message in case any choice other than "Ja" is made
      savedAlert(context);

    }
    else if(_selected==0){
      // navigates to task details when "Ja" is chosen
      navigateToAufgabeDetails(context);
    }
  }

   void onChanged(int value) {
    setState(() {
      _selected = value;
    });
  }

  List<Widget> aufgabeHomeList() {
    /// creates list of options on task home page
    List<Widget> list = new List<Widget>();
    List names = new List(4);
    names[0] = "Ja";
    names[1] = "keine Aufgabe";
    names[2] = "keine Angaben zur Aufgabe";
    names[3] = "Nicht relevant";

    list.add(new Text(
      "Liegen Informationen über die Aufgabe vor?",
      style: TextStyle(
        //decoration: TextDecoration.underline,
        fontSize: 18,
        color: Colors.blue,
      ),
    ));
    for (int i = 0; i < 4; i++) {
      list.add(new RadioListTile(
        value: i,
        title: Text(names[i]),
        groupValue: _selected,
        onChanged: (int value) {
          onChanged(value);
        },
        activeColor: Colors.green,
        //secondary: new Icon(Icons.shopping_basket),
      ));
    }
    list.add(new RaisedButton(
      child: new Text(
        "Weiter",
        style: TextStyle(
          fontSize: 17.0,
          color: Colors.white,
        ),
      ),
      color: Colors.blue,
      onPressed: onPressed,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)),
    ));

    return list;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Angaben zur Aufgabe"),
    ),
    body: Center(
      child: new Container(
        width: 500.0,
        height: 500,
        color: Colors.white70,
        alignment: Alignment.center,
        child: new Column(
          children: aufgabeHomeList(),
        ),
      ),
    ),
  );
}
Future<void> savedAlert(BuildContext context) {
  ///creates pop-up message
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Hinweis!'),
        content: const Text(
            'Eine Analyse ohne Aufgabe kann '
                'nicht durchgeführt werden'),
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

Future<void> savedAlert2(BuildContext context) {
  ///creates second pop-up message
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Hinweis!'),
        content: const Text(
            'Bitte treffen Sie eine Auswahl!'),
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

Future navigateToPatientHome(context) async => Navigator.push(
  /// navigates to patient home page
    context, MaterialPageRoute(builder: (context) => patientHome()));

Future navigateToAufgabeDetails(context) async => Navigator.push(
  /// navigates to task page
    context, MaterialPageRoute(builder: (context) => aufgabeDetails()));


