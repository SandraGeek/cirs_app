import "package:charts_flutter/flutter.dart" as charts;
import 'package:cirs_app/model/infoOutput_data.dart';
import 'package:cirs_app/model/userData.dart';
import 'package:cirs_app/ui/output_analysis/patientHome_output.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class info_output_details extends StatefulWidget {
  @override
  _Info_output_detailsState createState() => _Info_output_detailsState();
}

class _Info_output_detailsState extends State<info_output_details> {
  /// declares all user's selected options for each dropdown button and page title
  String selected;
  String selected1;
  String selected2;
  String selected3;
  String selected4;
  String pageTitle = "Information als Output";

  void onPressed() {
    // Checks for the listed conditions, generates and saves respective data objects (UserData) and navigates to the respective page or shows pop-up message.
    if ((selected == "1" && selected1 == "2") ||
        (selected == "2" && selected1 == "3 oder mehr") ||
        (selected == "1" && selected1 == "3 oder mehr")) {
      savedAlert(context);
    } else if (selected != null &&
        selected1 != null &&
        selected2 != null &&
        selected3 != null &&
        selected4 != null) {
      // generates a user data object with the required parameters
      UserData.myScoreData.add(InfoOutputData.generateUserDataObjects(
          "Information-Output",
          InfoOutputData.calculateScore(),
          charts.ColorUtil.fromDartColor(Colors.purple)));

      //generates the standard user data object for the information output component. According to the OPT-Model the highest score for information output is 19.
      UserData.myScoreData.add(InfoOutputData.generateUserDataObjects(
          "Information-Output",
          19 - InfoOutputData.calculateScore(), // this subtraction is performed to adequately present the remainder of the grey area on the bar chart
          charts.ColorUtil.fromDartColor(Colors.grey)));

      //print(UserData.myScoreData.toString());

      navigateToPatientOutput(context); //navigates to patient output home page
    } else {
      //shows second pop-message
      savedAlert2(context);
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
              // sets selected value to be new value
              InfoOutputData.setInfoQuelleAnzValue(value);
              setState(() => selected = value);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Anzahl der Empfänger",
              labelStyle: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
              isDense: true,
            ),
            value: selected1,
            //hint: Text("Anzahl der Empfänger"),
            items: ["1", "2", "3 oder mehr", "keine Angaben", "nicht relevant"]
                .map((label) => DropdownMenuItem(
                      child: Text(label),
                      value: label,
                    ))
                .toList(),
            onChanged: (value) {
              // sets selected value to be new value
              InfoOutputData.setEmpfaengerAnzValue(value);
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
              // sets selected value to be new value
              InfoOutputData.setInfoAustauschFormValue(value);
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
              // sets selected value to be new value
              InfoOutputData.setInfoTypUndStrukturValue(value);
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
              // sets selected value to be new value
              InfoOutputData.setInfoVolumenValue(value);
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
  //creates po-up message
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Hinweis!'),
        content: const Text(
            'Bitte Abhängigkeiten beachten: eine Informationsquelle kann'
            ' nur eine Empfänger geschickt werden, zwei Quellen an max. zwei Empfänger etc. '),
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

Future<void> savedAlert2(BuildContext context) {
  //creates second po-up message
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

Future navigateToPatientOutput(context) async {
  //navigates to patient output home page
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => patientHome_output()));
}
