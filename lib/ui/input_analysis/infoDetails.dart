import 'dart:ui';

import 'package:cirs_app/ui/input_analysis/infoHome.dart';
import 'package:cirs_app/ui/input_analysis/patientHome.dart';
import 'package:cirs_app/ui/input_analysis/probenmaterial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/info_options.dart';

class infoDetails extends StatefulWidget {
  @override
  _InfoDetailsState createState() => _InfoDetailsState();
}

class _InfoDetailsState extends State<infoDetails> {
  String selected;
  String selected1;
  String selected2;
  String selected3;
  String selected4;

  void onPressed() {
    navigateToPatientHome(context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Angaben zur Informationsquelle"),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Anzahl der Informationsquellen",
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
              labelText: "Anzahl der Absender",
              labelStyle: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
              isDense: true,
            ),
            value: selected1,
            //hint: Text("Anzahl der Absender"),
            items: ["1", "2", "3 oder mehr", "keine Angaben", "nicht relevant"]
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
              labelText: "Form des Informationsaustausches",
              labelStyle: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
              isDense: true,
            ),
            value: selected2,
           // hint: Text("Form des Informationsaustausches"),
            items: [
              "einzeln",
              "sequentiell",
              "quasi gleichzeitig",
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
              labelText: "Informationstyp und strukturiertheit",
              labelStyle: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
              isDense: true,
            ),
            value: selected3,
           // hint: Text("Informationstyp und strukturiertheit"),
            items: [
              "strukturiert digital",
              "unstrukturiert digital",
              "strukturiert gedruckt",
              "unstrukturiert gedruckt",
              "strukturiert handschriftlich",
              "unstrukturiert handschriftlich",
              "strukturiert gesprochen",
              "unstrukturiert gesprochen",
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
              labelText: "Informationsvolumen",
              labelStyle: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
              isDense: true,
            ),
            value: selected4,
           // hint: Text("Informationsvolumen"),
            items: ["gering", "gross", "keine Angaben", "nicht relevant"]
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

Future navigateToPatientHome(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => patientHome()));
}
