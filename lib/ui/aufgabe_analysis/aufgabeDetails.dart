import 'dart:ui';
import 'package:cirs_app/model/userData.dart';
import 'package:cirs_app/ui/aufgabe_analysis/resQuality.dart';
import 'package:cirs_app/ui/output_analysis/infoHome_output.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cirs_app/model/aufgabe_data.dart';
import "package:charts_flutter/flutter.dart" as charts;

class aufgabeDetails extends StatefulWidget {
  @override
  _AufgabeDetailsState createState() => _AufgabeDetailsState();
}

enum dqOption { first, second, third }

class _AufgabeDetailsState extends State<aufgabeDetails> {
  /// declares all user's selected options for each dropdown button and page title
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
  String pageTitle = "Angaben zur Aufgabe";

  void onPressed() {
    // Checks for the listed conditions (ifs), generates and saves respective data objects (UserData and/or ComplexityData) and navigates to the respective page or shows pop-up message.

    if (selected != null &&
        selected1 != null &&
        selected2 != null &&
        selected3 != null &&
        selected4 != null &&
        selected5 != null &&
        selected6 != null &&
        selected7 != null &&
        selected8 != null &&
        selected9 != null) {
      // the following conditions check if the values are more than 1, in which case they shall be stored and later presented as characteristics which increased the complexity of the performed task.

      if (selected2 == "2" || selected2 == "3 oder mehr") {
        UserData.myComplexityData.add(AufgabeData.generateUserComplexityObject(
            "Benutzung von medizinischen Geräten", selected2));
      }

      if (selected4 == "2" || selected4 == "3 oder mehr") {
        UserData.myComplexityData.add(AufgabeData.generateUserComplexityObject(
            "Benutzung von medizinischem Verbrauchsmaterial", selected4));
      }

      if (selected5 == "2" || selected5 == "3 oder mehr") {
        UserData.myComplexityData.add(AufgabeData.generateUserComplexityObject(
            "Anzahl involvierter medizinischer Domänen", selected5));
      }

      if (selected6 == "2" || selected6 == "3 oder mehr") {
        UserData.myComplexityData.add(AufgabeData.generateUserComplexityObject(
            "Anzahl involvierter Personen", selected6));
      }

      if (selected7 == "unterschiedliche hierarchische Ebenen") {
        UserData.myComplexityData.add(AufgabeData.generateUserComplexityObject(
            "Interne Teamkommunikation", selected7));
      }

      // generates a user data object with the required parameters
      UserData.myScoreData.add(AufgabeData.generateUserDataObjects(
          "Aufgabe",
          AufgabeData.calculateScore(),
          charts.ColorUtil.fromDartColor(Colors.yellow)));

      //generates the standard user data object for the task component. According to the OPT-Model the highest score for task is 30.
      UserData.myScoreData.add(AufgabeData.generateUserDataObjects(
          "Aufgabe",
          30 - AufgabeData.calculateScore(),

          // this subtraction is performed to adequately present the remainder of the grey area on the bar chart
          charts.ColorUtil.fromDartColor(Colors.grey)));

//      print(UserData.myScoreData.toString());
//      print(UserData.myComplexityData.toString());

      navigateResQ(context);
    } else {
      //shows pop-up message
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
                'Angaben zur Prozedur',
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
                  labelText: "Art der Prozedur",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected,
                //hint: Text("Anzahl der Informationsquellen"),
                items: [
                  "invasiv",
                  "nicht invasiv",
                  "keine Angaben",
                  "nicht relevant"
                ]
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  /// sets selected value to be new value
                  AufgabeData.setProzedurValue(value);
                  setState(() => selected = value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Kontaminationsgefahr",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected1,
                //hint: Text("Anzahl der Absender"),
                items: [
                  "keine Kontaminationsgefahr",
                  "latente Kontaminationsgefahr",
                  "manifeste Kontaminationsgefahr",
                  "keine Angaben",
                  "nicht relevant"
                ]
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  /// sets selected value to be new value
                  AufgabeData.setkontaminationValue(value);
                  setState(() => selected1 = value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Benutzung von medizinischen Geräten",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected2,
                // hint: Text("Form des Informationsaustausches"),
                items: [
                  "keines",
                  "1",
                  "2",
                  "3 oder mehr",
                  "keine Angaben",
                  "nicht relevant"
                ]
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  /// sets selected value to be new value
                  AufgabeData.setMedGeraeteValue(value);
                  setState(() => selected2 = value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Notwendiger Ausbildungsstand",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected3,
                // hint: Text("Informationstyp und strukturiertheit"),
                items: [
                  "PatientIn, Angehörige",
                  "PraktikantIn",
                  "StudentIn",
                  "GesundheitspflegerIn, MTA, PTA",
                  "FachpflegerIn, FachMTA, FachPTA",
                  "AssistenzaerztIn",
                  "FachaerztIn",
                  "keine Angaben",
                  "nicht relevant"
                ]
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  /// sets selected value to be new value
                  AufgabeData.setAusbildungsStandValue(value);
                  setState(() => selected3 = value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Benutzung von medizinischem Verbrauchsmaterial",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected4,
                // hint: Text("Informationsvolumen"),
                items: [
                  "keines",
                  "1",
                  "2",
                  "3 oder mehr",
                  "keine Angaben",
                  "nicht relevant"
                ]
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  /// sets selected value to be new value
                  AufgabeData.setMedMaterialValue(value);
                  setState(() => selected4 = value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Anzahl involvierter medizinischer Domänen",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected5,
                // hint: Text("Informationsvolumen"),
                items:
                    ["1", "2", "3 oder mehr", "keine Angaben", "nicht relevant"]
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                onChanged: (value) {
                  /// sets selected value to be new value
                  AufgabeData.setAnzMedDomaeneValue(value);
                  setState(() => selected5 = value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Anzahl involvierter Personen",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected6,
                // hint: Text("Informationsvolumen"),
                items:
                    ["1", "2", "3 oder mehr", "keine Angaben", "nicht relevant"]
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                onChanged: (value) {
                  /// sets selected value to be new value
                  AufgabeData.setAnzPersonenValue(value);
                  setState(() => selected6 = value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Text(
                'Angaben zu Kommunikation & Monitoring',
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
                  labelText: "Interne Teamkommunikation",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected7,
                // hint: Text("Informationsvolumen"),
                items: [
                  "gleiche hierarchische Ebene",
                  "unterschiedliche hierarchische Ebenen",
                  "keine Kommunikation",
                  "keine Angaben",
                  "nicht relevant"
                ]
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  /// sets selected value to be new value
                  AufgabeData.setKommunikationInternValue(value);
                  setState(() => selected7 = value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Anzahl verfügbarer Informationskanäle",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected8,
                // hint: Text("Informationsvolumen"),
                items:
                    ["1", "2", "3 oder mehr", "keine Angaben", "nicht relevant"]
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                onChanged: (value) {
                  /// sets selected value to be new value
                  AufgabeData.setAnzInfokanaeleValue(value);
                  setState(() => selected8 = value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Anzahl notwendiger Informationsentitäten",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  isDense: true,
                ),
                value: selected9,
                // hint: Text("Informationsvolumen"),
                items:
                    ["1", "2", "3 oder mehr", "keine Angaben", "nicht relevant"]
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                onChanged: (value) {
                  /// sets selected value to be new value
                  AufgabeData.setAnzInfoEntitaetenValue(value);
                  setState(() => selected9 = value);
                },
              ),
            ),
            new RaisedButton(
              child: new Text(
                "Weiter",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
              onPressed: onPressed,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
            )
          ])))));
}

Future<void> savedAlert(BuildContext context) {
  ///creates pop-up message
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Hinweis!'),
        content: const Text('Bitte alle Felder ausfüllen!'),
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

Future navigateToInfo_Output(context) async {
  /// navigates to information home page
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => infoHome_output()));
}

Future navigateResQ(context) async {
  /// navigates to resource page
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => res_quality()));
}
