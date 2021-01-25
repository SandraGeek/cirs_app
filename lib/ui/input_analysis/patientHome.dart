import 'package:cirs_app/ui/input_analysis/patientDetails.dart';
import 'package:cirs_app/ui/input_analysis/probenHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class patientHome extends StatefulWidget {
  @override
  _patientHomeState createState() => _patientHomeState();
}

class _patientHomeState extends State<patientHome> {
  int _selected;

  void onPressed() {
    if( _selected != 0){
      navigateToProbenHome(context);
    }else{
      navigateToPatientDetails(context);
    }
  }

  void onChanged(int value) {
    setState(() {
      _selected = value;
    });
  }

  List<Widget> patientHomeList() {
    List<Widget> list = new List<Widget>();
    List names = new List(4);
    names[0] = "Ja";
    names[1] = "kein Patient in dieser Aufgabe";
    names[2] = "kein Angaben";
    names[3] = "Nicht relevant";

    list.add(new Text(
      "Gibt es ein Patient?",
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
      title: Text("Angaben zum Patienten"),
    ),
    body: Center(
      child: new Container(
        width: 500.0,
        height: 500,
        color: Colors.white70,
        alignment: Alignment.center,
        child: new Column(
          children: patientHomeList(),
        ),
      ),
    ),
  );
}

Future navigateToProbenHome(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => probenHome()));

Future navigateToPatientDetails(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => patientDetails()));
