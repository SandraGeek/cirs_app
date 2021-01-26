import 'package:cirs_app/ui/input_analysis/patientHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'aufgabeDetails.dart';

class aufgabeHome extends StatefulWidget {
  @override
  _AufgabeHomeState createState() => _AufgabeHomeState();
}

class _AufgabeHomeState extends State<aufgabeHome> {
  int _selected;

  void onPressed() {
    if( _selected != 0){
      //ToDo
    }else{
      navigateToAufgabeDetails(context);
    }
  }

  void onChanged(int value) {
    setState(() {
      _selected = value;
    });
  }

  List<Widget> aufgabeHomeList() {
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

Future navigateToPatientHome(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => patientHome()));

Future navigateToAufgabeDetails(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => aufgabeDetails()));


