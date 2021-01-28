import 'dart:ui';
import 'package:cirs_app/ui/Results/feedback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class dq_output extends StatefulWidget {
  @override
  _Dq_outputState createState() => _Dq_outputState();
}

class _Dq_outputState extends State<dq_output> {
  String selected;
  String selected1;
  String selected2;
  String selected3;
  String selected4;
  String selected5;


  void onPressed() {
    if(selected != null && selected1 != null && selected2 != null && selected3 != null && selected4 != null && selected5 != null){
      navigateToFeedback(context);
    }
    else{
      savedAlert(context);
    }
  }


  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Output Qualität (Dokumentation)"),
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
  Future<void> savedAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hinweis!'),
          content: const Text(
              'Bitte alle Felder ausfüllen!'),
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

  Future navigateToFeedback(context) async => Navigator.push(
      context, MaterialPageRoute(builder: (context) => feedback()));
}

