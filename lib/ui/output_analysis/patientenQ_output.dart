import 'dart:ui';
import 'package:cirs_app/model/userData.dart';
import 'package:cirs_app/ui/Results/feedback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cirs_app/model/patientenQOutput_data.dart';

class PatientenQ_Output extends StatefulWidget {
  @override
  _PatientenQ_OutputState createState() => _PatientenQ_OutputState();
}

class _PatientenQ_OutputState extends State<PatientenQ_Output> {
  String selected;
  String selected1;
  String selected2;
  String selected3;
  String selected4;
  String selected5;
  String selected6;
  String selected7;
  String selected8;
  String selected9;
  String selected10;
  String selected11;
  String selected12;
  String selected13;
  String pageTitle = "Patientenqualitätszustand - Output";

  void onPressed() {
    if(selected != null && selected1 != null && selected2 != null && selected3 != null && selected4 != null && selected5 != null
        && selected6 != null && selected7 != null && selected8 != null && selected9 != null && selected10 != null && selected11 != null && selected12 != null && selected13 != null){

      UserData.myComplexityData.add(PatientenQOutputData.generateUserComplexityObject(
          "Administrative Identifikation", selected));
      UserData.myScoreData.add(PatientenQOutputData.generateUserDataObjects(
          pageTitle, PatientenQOutputData.calculateScore()));

      print( UserData.myScoreData.toString());
      print( UserData.myComplexityData.toString());
      UserData.myComplexityData.clear();
      UserData.myScoreData.clear();

      navigateToDq_output(context);
    }
    else{
      savedAlert(context);
    }
  }

 @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: SafeArea(
          child: Scrollbar(
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: new Text(
                            'Angaben zu Identifikation, Diagnostik und Therapie',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
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
                              PatientenQOutputData.setAdminIdentValue(value);
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
                              PatientenQOutputData.setPersIdentValue(value);
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
                              PatientenQOutputData.setLokalIdentValue(value);
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
                              PatientenQOutputData.setPlanungDiagnoseValue(value);
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
                              PatientenQOutputData.setDiagnoseValue(value);
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
                              PatientenQOutputData.setPlanungTherapieValue(value);
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
                            items: [ "richtig, vollständig", "richtig, unvollständig", "zeitlich verzögert", "falsch, NOS", "keine Angaben", "nicht relevant"]
                                .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                                .toList(),
                            onChanged: (value) {
                              PatientenQOutputData.setTherapieDurchValue(value);
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
                            items: [ "kontaminiert", "potentiell kontaminiert", "keine Kontamination",  "keine Angaben", "nicht relevant"]
                                .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                                .toList(),
                            onChanged: (value) {
                              PatientenQOutputData.setKontaminationValue(value);
                              setState(() => selected7 = value);
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: new Text(
                            'Angaben zu Dokumentation',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                          ),
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
                            value: selected8,
                            //hint: Text("Anzahl der Informationsquellen"),
                            items:
                            ["richtig, vollständig", "richtig, unvollständig, NOS", "fehlend", "falsch, NOS", "keine Angaben", "nicht relevant"]
                                .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                                .toList(),
                            onChanged: (value) {
                              PatientenQOutputData.setAllgemeinesValue(value);
                              setState(() => selected8 = value);
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
                            value: selected9,
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
                              PatientenQOutputData.setAbs_EmpfValue(value);
                              setState(() => selected9 = value);
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
                            value: selected10,
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
                              PatientenQOutputData.setPatIdentValue(value);
                              setState(() => selected10 = value);
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
                            value: selected11,
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
                              PatientenQOutputData.setDiagnoseDokuValue(value);
                              setState(() => selected11 = value);
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
                            value: selected12,
                            // hint: Text("Informationsvolumen"),
                            items: [ "richtig, vollständig", "richtig, unvollständig", "zeitlich verzögert", "falsch", "keine Angaben", "nicht relevant"]
                                .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                                .toList(),
                            onChanged: (value) {
                              PatientenQOutputData.setKlinischeGeschValue(value);
                              setState(() => selected12 = value);
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
                            value: selected13,
                            // hint: Text("Informationsvolumen"),
                            items: [ "richtig, vollständig", "richtig, unvollständig", "zeitlich verzögert", "falsch", "keine Angaben", "nicht relevant"]
                                .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                                .toList(),
                            onChanged: (value) {
                              PatientenQOutputData.setTherapieValue(value);
                              setState(() => selected13 = value);
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

Future navigateToDq_output(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => feedback()));
}