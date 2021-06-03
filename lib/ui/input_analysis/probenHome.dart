import 'package:cirs_app/ui/aufgabe_analysis/aufgabeHome.dart';
import 'package:cirs_app/ui/input_analysis/infoHome.dart';
import 'package:cirs_app/ui/input_analysis/patientenQ_Input.dart';
import 'package:cirs_app/ui/input_analysis/probenDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cirs_app/ui/input_analysis/patientHome.dart';

class probenHome extends StatefulWidget {
  @override
  ProbenHomeState createState() => ProbenHomeState();
}

class ProbenHomeState extends State<probenHome> {
  /// This class shows the options needed to provide material input data or not
  static int selected;

  void onPressed() {
    // this condition checks if the user has provided data on information and/or patient. If not the second pop-up message is shown
    if ((selected == 1 || selected == 2 || selected == 3) &&
        ((patientHomeState.selected == 1) ||
            (patientHomeState.selected == 2) ||
            (patientHomeState.selected == 3)) &&
        ((infoHomeState.selected == 1) ||
            (infoHomeState.selected == 2) ||
            (infoHomeState.selected == 3))) {
      savedAlert2(context);

    } else if (selected != null) {
      if (selected == 0) {
        // navigates to material input details when "Ja" is chosen
        navigateToProbenDetails(context);
      }

      // this condition checks if the user has provided data on information (input). If yes navigate to task home page
      else if ((selected == 1 || selected == 2 || selected == 3) &&
          ((patientHomeState.selected == 1) ||
              (patientHomeState.selected == 2) ||
              (patientHomeState.selected == 3)) &&
          (infoHomeState.selected == 0)) {
        navigateToAufgabenHome(context);
      }

      // this condition checks if the user has provided data on information (input) and patient (input). If yes navigate to patient quality state (input) page
      else if ((selected == 1 || selected == 2 || selected == 3) &&
          ((patientHomeState.selected != 1) ||
              (patientHomeState.selected != 2) ||
              (patientHomeState.selected != 3)) &&
          ((infoHomeState.selected != 1) ||
              (infoHomeState.selected != 2) ||
              (infoHomeState.selected != 3))) {
        navigateToPatientenQ_Input(context);
      }
    } else {
      // shows pop-up message in case no choice is made
      savedAlert(context);
    }
  }

  void onChanged(int value) {
    //sets selected option as the list value
    setState(() {
      selected = value;
    });
  }

  List<Widget> probenHomeList() {
    /// creates list of options on material input home page
    List<Widget> list = new List<Widget>();
    List options = new List(4);
    options[0] = "Ja";
    options[1] = "kein Probenmaterial";
    options[2] = "keine Angaben";
    options[3] = "Nicht relevant";

    list.add(new Text(
      "Sind Probenmaterial/Medikamenten vorhanden?",
      style: TextStyle(
        //decoration: TextDecoration.underline,
        fontSize: 18,
        color: Colors.blue,
      ),
    ));
    for (int i = 0; i < 4; i++) {
      list.add(new RadioListTile(
        value: i,
        title: Text(options[i]),
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
          title: Text("Angaben zu Probenmaterial"),
        ),
        body: Center(
          child: new Container(
            width: 500.0,
            height: 500,
            color: Colors.white70,
            alignment: Alignment.center,
            child: new Column(
              children: probenHomeList(),
            ),
          ),
        ),
      );
}

Future<void> savedAlert(BuildContext context) {
  ///creates pop-up message
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
  ///creates second pop-up message
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

Future navigateToProbenDetails(context) async => Navigator.push(
  /// navigates to material input details page
    context, MaterialPageRoute(builder: (context) => probenDetails()));

Future navigateToPatientenQ_Input(context) async => Navigator.push(
  /// navigates to patient quality state input page
    context, MaterialPageRoute(builder: (context) => PatientenQ_Input()));

Future navigateToAufgabenHome(context) async => Navigator.push(
  /// navigates to task page
    context, MaterialPageRoute(builder: (context) => aufgabeHome()));
