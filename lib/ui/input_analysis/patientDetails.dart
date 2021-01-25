import 'dart:ui';
import 'package:cirs_app/ui/input_analysis/probenDetails.dart';
import 'package:cirs_app/ui/input_analysis/probenHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class patientDetails extends StatefulWidget {
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<patientDetails> {
  String selected;
  String selected1;
  String selected2;
  String selected3;
  String selected4;

  void onPressed() {
    navigateToProbenHome(context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Angaben zum Patienten"),
      ),
      body:
      Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: DropdownButtonFormField<String>(
           //, itemHeight: 2,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Anzahl der medizinischen Domänen",
              labelStyle: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
              isDense: true,
            ),
            value: selected,
            //hint: Text("Anzahl der Informationsquellen"),
            items: ["1", "2", "3 oder mehr", "keine Angaben", "nicht relevant"]
                .map((label) => DropdownMenuItem(
              child: Text(label),
              value: label,
            ))
                .toList(),
            onChanged: (value) {
              setState(() => selected = value);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Uebereinstimmung der medizinischen Domaene der AerztIn mit der medizinischen Domaene der PatientIn",
              labelStyle: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
              isDense: true,
            ),
            value: selected1,
            //hint: Text("Anzahl der Absender"),
            items: ["vollständig", "teilweise", "keine", "keine Angaben", "nicht relevant"]
                .map((label) => DropdownMenuItem(
              child: Text(label),
              value: label,
            ))
                .toList(),
            onChanged: (value) {
              setState(() => selected1 = value);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Häufigkeit des medizinischen Problems",
              labelStyle: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
              isDense: true,
            ),
            value: selected2,
            // hint: Text("Form des Informationsaustausches"),
            items: [
              "häufig",
              "selten",
              "keine Angaben",
              "nicht relevant"
            ]
                .map((label) => DropdownMenuItem(
              child: Text(label),
              value: label,
            ))
                .toList(),
            onChanged: (value) {
              setState(() => selected2 = value);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Kommunikationsmöglichkeiten der Patient",
              labelStyle: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
              isDense: true,
            ),
            value: selected3,
            // hint: Text("Informationstyp und strukturiertheit"),
            items: [
              "normale Kommunikation möglich",
              "Kommunikation nur über Dritte",
              "keine Kommunikation möglich",
              "keine Angaben",
              "nicht relevant"
            ]
                .map((label) => DropdownMenuItem(
              child: Text(label),
              value: label,
            ))
                .toList(),
            onChanged: (value) {
              setState(() => selected3 = value);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Priorität",
              labelStyle: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
              isDense: true,
            ),
            value: selected4,
            // hint: Text("Informationsvolumen"),
            items: ["niedrig", "mittel", "hoch", "keine Angaben", "nicht relevant"]
                .map((label) => DropdownMenuItem(
              child: Text(label),
              value: label,
            ))
                .toList(),
            onChanged: (value) {
              setState(() => selected4 = value);
            },
          ),
        ),
        new RaisedButton(
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
        )
      ]));
}

Future navigateToProbenHome(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => probenHome()));
}
