import 'package:cirs_app/model/userData.dart';
import 'package:cirs_app/ui/Results/feedback.dart';
import 'package:cirs_app/ui/output_analysis/patientenQ_output.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cirs_app/model/probenOutput_data.dart';
import 'package:cirs_app/ui/output_analysis/patientHome_output.dart';
import "package:charts_flutter/flutter.dart" as charts;

class proben_output_details extends StatefulWidget {
  @override
  _Proben_output_detailsState createState() => _Proben_output_detailsState();
}

class _Proben_output_detailsState extends State<proben_output_details> {
  /// declares all user's selected options for each dropdown button and page title
  String selected;
  String selected1;
  String pageTitle = "Probenmaterial als Output";

  void onPressed() {
// Checks for the listed conditions, generates and saves respective data objects (UserData) and navigates to the respective page or shows pop-up message.
    if ((selected == "1" && selected1 == "2") ||
        (selected == "2" && selected1 == "3 oder mehr") ||
        (selected == "1" && selected1 == "3 oder mehr")) {
      savedAlert(context);
    } else if (selected != null && selected1 != null) {
      //checks if patient details have been provided
      if ((patientHome_outputState.selected == 1) ||
          (patientHome_outputState.selected == 2) ||
          (patientHome_outputState.selected == 3)) {
        // if not, generates a user data object with the required parameters and navigates to task home page
        UserData.myScoreData.add(ProbenOutputData.generateUserDataObjects(
            "Proben-Output",
            ProbenOutputData.calculateScore(),
            charts.ColorUtil.fromDartColor(Colors.blue)));

        //generates the standard user data object for material details output component. According to the OPT-Model the highest score for material details output is 6.
        UserData.myScoreData.add(ProbenOutputData.generateUserDataObjects(
            "Proben-Output",
            6 - ProbenOutputData.calculateScore(),
            charts.ColorUtil.fromDartColor(Colors
                .grey))); // this subtraction is performed to adequately present the remainder of the grey area on the bar chart
        // print(UserData.myScoreData.toString());

        navigateToFeedback(context); // navigates to feedback page
      } else {
        // if yes, generates a user data object with the required parameters and navigates to task patient quality state output page

        UserData.myScoreData.add(ProbenOutputData.generateUserDataObjects(
            "Proben-Output",
            ProbenOutputData.calculateScore(),
            charts.ColorUtil.fromDartColor(Colors.blue)));

        //generates the standard user data object for material details output component. According to the OPT-Model the highest score for material details output is 6.
        UserData.myScoreData.add(ProbenOutputData.generateUserDataObjects(
            "Proben-Output",
            6 - ProbenOutputData.calculateScore(), // this subtraction is performed to adequately present the remainder of the grey area on the bar chart
            charts.ColorUtil.fromDartColor(Colors.grey)));

        // print(UserData.myScoreData.toString());

        navigateToPq_output(context); //navigates to patient quality state output page
      }
    } else {
      // shows second pop-up message
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
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: DropdownButtonFormField<String>(
            //, itemHeight: 2,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Anzahl der Probenitems/Medikamente",
              labelStyle: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
              isDense: true,
            ),
            value: selected,
            //hint: Text("Anzahl der Informationsquellen"),
            items: ["1", "2", "3 oder mehr", "keine Angabe", "nicht relevant"]
                .map((label) => DropdownMenuItem(
                      child: Text(label),
                      value: label,
                    ))
                .toList(),
            onChanged: (value) {
              // sets selected value to be new value
              ProbenOutputData.setProbenAnzAnzValue(value);
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
            // hint: Text("Informationsvolumen"),
            items: ["1", "2", "3 oder mehr", "keine Angabe", "nicht relevant"]
                .map((label) => DropdownMenuItem(
                      child: Text(label),
                      value: label,
                    ))
                .toList(),
            onChanged: (value) {
              // sets selected value to be new value
              ProbenOutputData.setEmpfaengerAnzValue(value);
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
  //creates pop-up message
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Hinweis!'),
        content: const Text(
            'Bitte Abhängigkeiten beachten: ein Probenmaterial kann'
            ' nur eine Empfänger geschickt werden, zwei an max. zwei Empfänger etc. '),
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
  //creates second pop-up message
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

Future navigateToPq_output(context) async => Navigator.push(
  //navigates to patient quality state ouput page
    context, MaterialPageRoute(builder: (context) => PatientenQ_Output()));

Future navigateToFeedback(context) async => Navigator.push(
  //navigates to feedback page
    context, MaterialPageRoute(builder: (context) => feedback()));
