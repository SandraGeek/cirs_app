import 'package:cirs_app/ui/input_analysis/patientDetails.dart';
import 'package:cirs_app/ui/input_analysis/probenHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class patientHome extends StatefulWidget {
  @override
  patientHomeState createState() => patientHomeState();
}

class patientHomeState extends State<patientHome> {
  static int selected;

  void onPressed() {

    if(selected == null){
      savedAlert(context);
    }
    else if( selected != 0){
      navigateToProbenHome(context);

    }
    else if(selected==0){
      navigateToPatientDetails(context);

    }
  }


  void onChanged(int value) {
    setState(() {
      selected = value;
    });
  }

  List<Widget> patientHomeList() {
    List<Widget> list = new List<Widget>();
    List options = new List(4);
    options[0] = "Ja";
    options[1] = "kein PatientIn in dieser Aufgabe";
    options[2] = "kein Angaben";
    options[3] = "Nicht relevant";

    list.add(new Text(
      "Gibt es ein PatientIn?",
      style: TextStyle(
        //decoration: TextDecoration.underline,
        fontSize: 18,
        color: Colors.blue,
      ),
    ));
    for (int i = 0; i < 4; i++) {
      list.add(new RadioListTile(
        value: i,
        title: Text(options[i]),
        groupValue: selected,
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

Future<void> savedAlert(BuildContext context) {
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

Future navigateToProbenHome(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => probenHome()));

Future navigateToPatientDetails(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => patientDetails()));
