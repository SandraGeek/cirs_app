import 'package:cirs_app/model/userData.dart';
import 'package:cirs_app/ui/input_analysis/probenHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cirs_app/model/patientInput_data.dart';
import "package:charts_flutter/flutter.dart" as charts;

// ignore: camel_case_types
class patientDetails extends StatefulWidget {
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<patientDetails> {
  /// declares all user's selected options for each dropdown button and page title

  String selected;
  String selected1;
  String selected2;
  String selected3;
  String selected4;
  String pageTitle = "Angaben zum Patienten";

  void onPressed() {
    // Checks for the listed conditions, generates and saves respective data objects (UserData) and navigates to the respective page or shows pop-up message.
    if (selected != null ||
        selected1 != null ||
        selected2 != null ||
        selected3 != null ||
        selected4 != null) {
      // generates a user data object with the required parameters
      UserData.myScoreData.add(PatientInputData.generateUserDataObjects(
          "Patient-Input",
          PatientInputData.calculateScore(),
          charts.ColorUtil.fromDartColor(Colors.amber)));

      //generates the standard user data object for the patient input component. According to the OPT-Model the highest score for patient input is 12.
      UserData.myScoreData.add(PatientInputData.generateUserDataObjects(
          "Patient-Input",
          12 - PatientInputData.calculateScore(), // this subtraction is performed to adequately present the remainder of the grey area on the bar chart
          charts.ColorUtil.fromDartColor(Colors.grey)));

      //print(UserData.myScoreData.toString());

      navigateToProbenHome(context); //navigates toi material input home page
    } else {
      //shows pop-message
      savedAlert(context);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
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
              // sets selected value to be new value
              PatientInputData.setMedDomaeneAnzValue(value);
              setState(() => selected = value);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText:
                  "Uebereinstimmung der medizinischen Domaene der AerztIn mit der medizinischen Domaene der PatientIn",
              labelStyle: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
              isDense: true,
            ),
            value: selected1,
            //hint: Text("Anzahl der Absender"),
            items: [
              "vollständig",
              "teilweise",
              "keine",
              "keine Angaben",
              "nicht relevant"
            ]
                .map((label) => DropdownMenuItem(
                      child: Text(label),
                      value: label,
                    ))
                .toList(),
            onChanged: (value) {
              // sets selected value to be new value
              PatientInputData.setDomaeneArztZuPatValue(value);
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
            items: ["häufig", "selten", "keine Angaben", "nicht relevant"]
                .map((label) => DropdownMenuItem(
                      child: Text(label),
                      value: label,
                    ))
                .toList(),
            onChanged: (value) {
              // sets selected value to be new value
              PatientInputData.setHaeufigkeitValue(value);
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
              // sets selected value to be new value
              PatientInputData.setKommunikationValue(value);
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
            items:
                ["niedrig", "mittel", "hoch", "keine Angaben", "nicht relevant"]
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
            onChanged: (value) {
              // sets selected value to be new value
              PatientInputData.setPrioritaetValue(value);
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

Future navigateToProbenHome(context) async {
  /// navigates to material home page
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => probenHome()));
}
