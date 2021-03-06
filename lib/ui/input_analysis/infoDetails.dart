import "package:charts_flutter/flutter.dart" as charts;
import 'package:cirs_app/ui/input_analysis/patientHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cirs_app/model/userData.dart';
import 'package:cirs_app/model/infoInput_data.dart';

class infoDetails extends StatefulWidget {
  @override
  _InfoDetailsState createState() => _InfoDetailsState();
}

class _InfoDetailsState extends State<infoDetails> {
  /// declares all user's selected options for each dropdown button and page title
  String selected;
  String selected1;
  String selected2;
  String selected3;
  String selected4;
  String pageTitle = "Angaben zur Informationsquelle";

  void onPressed() {
    // Checks for the listed conditions, generates and saves respective data objects (UserData) and navigates to the respective page or shows pop-up message.
    if ((selected == "1" && selected1 == "2") ||
        (selected == "2" && selected1 == "3 oder mehr") ||
        (selected == "1" && selected1 == "3 oder mehr")) {
      savedAlert(context);
    } else if (selected != null ||
        selected1 != null ||
        selected2 != null ||
        selected3 != null ||
        selected4 != null) {
      // generates a user data object with the required parameters
      UserData.myScoreData.add(InfoInputData.generateUserDataObjects(
          "Information-Input",
          InfoInputData.calculateScore(),
          charts.ColorUtil.fromDartColor(Colors.orange)));

      //generates the standard user data object for the information input component. According to the OPT-Model the highest score for information input is 19.
      UserData.myScoreData.add(InfoInputData.generateUserDataObjects(

          "Information-Input",
          19 - InfoInputData.calculateScore(),  // this subtraction is performed to adequately present the remainder of the grey area on the bar chart
          charts.ColorUtil.fromDartColor(Colors.grey)));
      //print(UserData.myScoreData.toString());

      navigateToPatientHome(context); // navigates to patient input home page
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
              InfoInputData.setInfoQuelleAnzValue(value);
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
              // sets selected value to be new value
              InfoInputData.setAbsenderAnzValue(value);
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
              InfoInputData.setInfoAustauschFormValue(value);
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
              InfoInputData.setInfoTypUndStrukturValue(value);
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
              InfoInputData.setInfoVolumenValue(value);
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
        content: const Text('Bitte Abhängigkeiten beachten: eine '
            'Informationsquelle kann'
            ' nur von einem Absender kommen, zwei Quellen'
            ' von max. zwei Absendern etc. '),
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
  ///creates second pop-up message
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

Future navigateToPatientHome(context) async {
  /// navigates to patient home page
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => patientHome()));
}
