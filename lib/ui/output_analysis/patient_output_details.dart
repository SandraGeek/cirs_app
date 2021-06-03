import "package:charts_flutter/flutter.dart" as charts;
import 'package:cirs_app/model/userData.dart';
import 'package:cirs_app/ui/output_analysis/probenHome_output.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cirs_app/model/patientOutput_data.dart';

class patient_output_details extends StatefulWidget {
  @override
  _Patient_output_detailsState createState() => _Patient_output_detailsState();
}

class _Patient_output_detailsState extends State<patient_output_details> {
  /// declares all user's selected options for each dropdown button and page title
  String selected;
  String selected1;
  String pageTitle = "PatientIn als Output";

  void onPressed() {
    // Checks for the listed conditions, generates and saves respective data objects (UserData) and navigates to the respective page or shows pop-up message.
    if (selected != null && selected1 != null) {
      // generates a user data object with the required parameters
      UserData.myScoreData.add(PatientOutputData.generateUserDataObjects(
          "Patient-Output",
          PatientOutputData.calculateScore(),
          charts.ColorUtil.fromDartColor(Colors.lightGreenAccent)));
      //generates the standard user data object for the patient output component. According to the OPT-Model the highest score for patient output is 6.
      UserData.myScoreData.add(PatientOutputData.generateUserDataObjects(
          "Patient-Output",
          6 - PatientOutputData.calculateScore(),  // this subtraction is performed to adequately present the remainder of the grey area on the bar chart
          charts.ColorUtil.fromDartColor(Colors.grey)));

      //print(UserData.myScoreData.toString());

      navigateToProbenOutput(context); //navigates to material output home page
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
          padding: const EdgeInsets.all(10.0),
          child: DropdownButtonFormField<String>(
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
              PatientOutputData.setMedDomaeneAnzValue(value);
              setState(() => selected = value);
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
            value: selected1,
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
              PatientOutputData.setPrioritaetValue(value);
              setState(() => selected1 = value);
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

Future navigateToProbenOutput(context) async {
  //navigates to material output home page
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => probenHome_output()));
}
