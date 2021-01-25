import 'dart:ui';
import 'package:cirs_app/ui/aufgabe_analysis/res_quality.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class output extends StatefulWidget {
  @override
  _OutputState createState() => _OutputState();
}
enum outputOption { first, second, third }

class _OutputState extends State<output> {
  String selected;
  String selected1;
  String selected2;
  String selected3;
  String selected4;
  String selected5;
  String selected6;
  String selected7;
  outputOption _option;


  void onPressed() {
    navigateToResQ(context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Output"),
      ),
      body: SafeArea(
          child: Scrollbar(

              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        RadioListTile<outputOption>(
                          title: const Text('keine Aufgabe'),
                          value: outputOption.first,
                          groupValue: _option,
                          onChanged: (outputOption value) {
                            setState(() {
                              _option = value;
                            });
                            navigateToResQ(context);
                          },
                        ),
                        RadioListTile<outputOption>(
                          title: const Text('keine Angaben zur Aufgabe'),
                          value: outputOption.second,
                          groupValue: _option,
                          onChanged: (outputOption value) {
                            setState(() {
                              _option = value;
                            });
                          },
                        ),
                        RadioListTile<outputOption>(
                          title: const Text('nicht relevant'),
                          value: outputOption.third,
                          groupValue: _option,
                          onChanged: (outputOption value) {
                            setState(() {
                              _option = value;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Allgemeines",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                              isDense: true,
                            ),
                            value: selected,
                            //hint: Text("Anzahl der Informationsquellen"),
                            items:
                            ["richtig, vollständig", "richtig, unvollständig, NOS", "fehlend", "falsch", "keine Angaben", "nicht relevant"]
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
                              labelText: "Absender/Empfänger",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                              isDense: true,
                            ),
                            value: selected1,
                            //hint: Text("Anzahl der Absender"),
                            items:
                            ["Absender richtig, vollständig", "Absender richtig, unvollständig", "Absender fehlend", "falsche Absender", "keine Angaben zum Absender", "Absender nicht relevant",
                              "Adressat richtig, vollständig", "Adressat richtig, unvollständig", "Adressat fehlend", "falsche Adressat", "keine Angaben zum Adressat", "Adressat nicht relevant"]
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
                              labelText: "Patientidentifikation",
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
                              labelText: "Diagnose",
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
                              labelText: "Klinische Geschichte",
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
                              labelText: "Therapie",
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

Future navigateToResQ(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => res_quality()));
}
