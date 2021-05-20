import 'package:cirs_app/ui/Results/feedback.dart';
import 'package:cirs_app/ui/output_analysis/patientenQ_output.dart';
import 'package:cirs_app/ui/output_analysis/proben_output_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cirs_app/ui/output_analysis/infoHome_output.dart';
import 'package:cirs_app/ui/output_analysis/patientHome_output.dart';

class probenHome_output extends StatefulWidget {
  @override
  Proben_OutputState createState() => Proben_OutputState();
}

class Proben_OutputState extends State<probenHome_output> {
  static int selected;

  void onPressed() {
    if (selected == null) {
      savedAlert(context);
    }

    if (selected == 0) {
      navigateToproben_output_details(context);}

    else if( (selected == 1 || selected == 2 || selected == 3) &&  ((patientHome_outputState.selected == 1) || (patientHome_outputState.selected == 2) ||
        (patientHome_outputState.selected == 3)) && (info_OutputState == 0 ) ){
      navigateToFeedback(context);
    }


    else if ((selected == 1 || selected == 2 || selected == 3) &&
        ((patientHome_outputState.selected == 1) ||
            (patientHome_outputState.selected == 2) ||
            (patientHome_outputState.selected == 3)) &&
        ((info_OutputState.selected == 1) ||
            (info_OutputState.selected == 2) ||
            (info_OutputState.selected == 3))) {
      savedAlert2(context);

    }
    else if ((selected == 1 || selected == 2 || selected == 3) &&
        ((patientHome_outputState.selected != 1) ||
            (patientHome_outputState.selected != 2) ||
            (patientHome_outputState.selected != 3)) &&
        ((info_OutputState.selected != 1) ||
            (info_OutputState.selected != 2) ||
            (info_OutputState.selected != 3))) {
      navigateToPatientenQ_Output(context);
    }
  }

  void onChanged(int value) {
    setState(() {
      selected = value;
    });
  }

  List<Widget> proben_outputList() {
    List<Widget> list = new List<Widget>();
    List names = new List(4);
    names[0] = "Ja";
    names[1] = "keine Probenmaterial/medikamente als Output";
    names[2] = "keine Angabe";
    names[3] = "Nicht relevant";

    list.add(new Text(
      "Sind Probenmaterial/medikamente Bestandteil des Ergebnisses der Aufgabe?",
      style: TextStyle(
        //decoration: TextDecoration.underline,
        fontSize: 18,
        color: Colors.blue,
      ),
    ));
    for (int i = 0; i < 4; i++) {
      list.add(new RadioListTile(
        value: i,
        title: Text(names[i]),
        groupValue: selected,
        onChanged: (int value) {
          onChanged(value);
        },
        activeColor: Colors.green,
        //secondary: new Icon(Icons.shopping_basket),
      ));
    }
    list.add(new RaisedButton(
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
    ));

    return list;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Probenmaterial als Output"),
        ),
        body: Center(
          child: new Container(
            width: 500.0,
            height: 500,
            color: Colors.white70,
            alignment: Alignment.center,
            child: new Column(
              children: proben_outputList(),
            ),
          ),
        ),
      );
}

Future<void> savedAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Hinweis!'),
        content: const Text('Bitte treffen Sie eine Auswahl!'),
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
        content: const Text(
            'Sie müssen Angaben zu Information oder Patient oder Probenmaterial geben!'),
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

Future navigateToproben_output_details(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => proben_output_details()));

Future navigateToPatientenQ_Output(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => PatientenQ_Output()));


Future navigateToFeedback(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => feedback()));
