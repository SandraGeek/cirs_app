import 'package:cirs_app/ui/input_analysis/patientDetails.dart';
import 'package:cirs_app/ui/input_analysis/patientHome.dart';
import 'package:cirs_app/ui/input_analysis/probenmaterial.dart';
import 'infoDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class infoHome extends StatefulWidget {
  @override
  _infoHomeState createState() => _infoHomeState();
}

class _infoHomeState extends State<infoHome> {
  int _selected = 0;

  void onPressed() {
   if( _selected == 1 || _selected == 2){
    navigateToPatientHome(context);
  }else{
     navigateToInfDetails(context);
   }
  }

  void onChanged(int value) {
    setState(() {
      _selected = value;
    });
  }

  List<Widget> infoHomeList() {
    List<Widget> list = new List<Widget>();
    List names = new List(3);
    names[0] = "Ja";
    names[1] = "Nein";
    names[2] = "Nicht relevant";

    list.add(new Text(
      "Werden für die Aufgabe Informationen verwendet?",
      style: TextStyle(
        //decoration: TextDecoration.underline,
        fontSize: 18,
        color: Colors.blue,
      ),
    ));
    for (int i = 0; i < 3; i++) {
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
          title: Text("Angaben zur Informationsquelle"),
        ),
        body: Center(
          child: new Container(
            width: 500.0,
            height: 500,
            color: Colors.white70,
            alignment: Alignment.center,
            child: new Column(
              children: infoHomeList(),
            ),
          ),
        ),
      );
}

Future navigateToPatientHome(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => patientHome()));

Future navigateToInfDetails(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => infoDetails()));


