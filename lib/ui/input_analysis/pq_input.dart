import 'dart:ui';

import 'package:cirs_app/ui/input_analysis/dq_input.dart';
import 'package:cirs_app/ui/input_analysis/infoHome.dart';
import 'package:cirs_app/ui/input_analysis/patientHome.dart';
import 'package:cirs_app/ui/input_analysis/probenDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/info_options.dart';

class pq_input extends StatefulWidget {
  @override
  _Pq_inputState createState() => _Pq_inputState();
}

class _Pq_inputState extends State<pq_input> {
   String selected;
  String selected1;
  String selected2;
  String selected3;
  String selected4;
   String selected5;
   String selected6;
   String selected7;

  void onPressed() {
    navigateToDq_input(context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Input Qualität (Patient)"),
      ),
      body: SafeArea(
          child: Scrollbar(
   child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Administrative Identifikation",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected,
                //hint: Text("Anzahl der Informationsquellen"),
                items:
                    ["richtig, vollständig", "richtig, unvollständig", "fehlend", "falsch", "keine Angaben", "nicht relevant"]
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
                  labelText: "Persönliche Identifikation",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected1,
                //hint: Text("Anzahl der Absender"),
                items:
                    ["richtig, vollständig", "richtig, unvollständig", "fehlend", "falsch", "keine Angaben", "nicht relevant"]
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
                  labelText: "Lokalisationsidentifikation",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected2,
                // hint: Text("Form des Informationsaustausches"),
                items: [
                  "richtig, vollständig", "richtig, unvollständig", "fehlend", "falsch", "keine Angaben", "nicht relevant"
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
                  labelText: "Planung Diagnostik",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected3,
                // hint: Text("Informationstyp und strukturiertheit"),
                items: [
                  "richtig, vollständig", "richtig, unvollständig", "zeitlich verzögert", "falsch", "keine Angaben", "nicht relevant"
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
                  labelText: "Diagnose",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected4,
                // hint: Text("Informationsvolumen"),
                items: [ "richtig, vollständig", "richtig, unvollständig", "zeitlich verzögert", "falsch", "keine Angaben", "nicht relevant"]
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Planung Therapie",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected5,
                // hint: Text("Informationsvolumen"),
                items: [ "richtig, vollständig", "richtig, unvollständig", "zeitlich verzögert", "falsch", "keine Angaben", "nicht relevant"]
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() => selected5 = value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Therapiedurchführung",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected6,
                // hint: Text("Informationsvolumen"),
                items: [ "richtig, vollständig", "richtig, unvollständig", "zeitlich verzögert", "falsch NOS", "keine Angaben", "nicht relevant"]
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() => selected6 = value);
                },
              ),
            ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Kontamination",
                      labelStyle: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                      ),
                      isDense: true,
                    ),
                    value: selected7,
                    // hint: Text("Informationsvolumen"),
                    items: [ "kontaminiert", "potentiell kontaminiert", "keine",  "keine Angaben", "nicht relevant"]
                        .map((label) => DropdownMenuItem(
                      child: Text(label),
                      value: label,
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() => selected7 = value);
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
          ]
          )
   )
          )
      )
  );
}

Future navigateToDq_input(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => dq_input()));
}
