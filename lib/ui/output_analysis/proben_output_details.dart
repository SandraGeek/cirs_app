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
  String selected;
  String selected1;
  String pageTitle = "Probenmaterial als Output";

  void onPressed() {

    if ((selected == "1" && selected1 == "2") ||
        (selected == "2" && selected1 == "3 oder mehr") ||
        (selected == "1" && selected1 == "3 oder mehr")) {
      savedAlert(context);
    }

    else if (selected != null && selected1 != null) {

        if ((patientHome_outputState.selected == 1) ||
            (patientHome_outputState.selected == 2) ||
            (patientHome_outputState.selected == 3)) {

          UserData.myScoreData.add(ProbenOutputData.generateUserDataObjects(
              "ProbenO", ProbenOutputData.calculateScore(), charts.ColorUtil.fromDartColor(Colors.blue) ));
          print(UserData.myScoreData.toString());

          navigateToFeedback(context);
        } else {

          UserData.myScoreData.add(ProbenOutputData.generateUserDataObjects(
              "Probenmaterial - Output", ProbenOutputData.calculateScore(), charts.ColorUtil.fromDartColor(Colors.blue)));

          print(UserData.myScoreData.toString());

          navigateToPq_output(context);
        }
      }
    else {
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
    context, MaterialPageRoute(builder: (context) => PatientenQ_Output()));

Future navigateToFeedback(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => feedback()));
