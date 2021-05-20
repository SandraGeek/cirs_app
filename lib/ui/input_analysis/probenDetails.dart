import 'package:cirs_app/model/userData.dart';
import 'package:cirs_app/ui/aufgabe_analysis/aufgabeHome.dart';
import 'package:cirs_app/ui/input_analysis/patientenQ_Input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cirs_app/model/probenInput_data.dart';
import 'package:cirs_app/ui/input_analysis/patientHome.dart';

class probenDetails extends StatefulWidget {
  @override
  _ProbenDetailsState createState() => _ProbenDetailsState();
}

class _ProbenDetailsState extends State<probenDetails> {

  String selected;
  String selected1;
  String pageTitle = "Angaben zu Probenmaterial";

  void onPressed() {


    if((selected == "1" && selected1 == "2") ||(selected == "2" && selected1 == "3 oder mehr")||(selected == "1" && selected1 == "3 oder mehr")) {
      savedAlert(context);
    }

    else if(( patientHomeState.selected == 1) || (patientHomeState.selected == 2) || (patientHomeState.selected == 3)  ){
      navigateToAufgabenHome(context);
    }

    else if(selected != null && selected1 != null){
      UserData.myComplexityData.add(ProbenInputData.generateUserComplexityObject(
          "Anzahl der Absender", selected1));
      UserData.myScoreData.add(ProbenInputData.generateUserDataObjects(
          pageTitle, ProbenInputData.calculateScore()));

      print( UserData.myScoreData.toString());
      print( UserData.myComplexityData.toString());
      UserData.myComplexityData.clear();
      UserData.myScoreData.clear();
      navigateToPq_input(context);
    }
    else{
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
              ProbenInputData.setProbenAnzAnzValue(value);
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
            // hint: Text("Informationsvolumen"),
            items: ["1", "2", "3 oder mehr", "keine Angabe", "nicht relevant"]
                .map((label) => DropdownMenuItem(
              child: Text(label),
              value: label,
            ))
                .toList(),
            onChanged: (value) {
              ProbenInputData.setAbsenderAnzValue(value);
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
            'Bitte Abhängigkeiten beachten: ein Probenmaterial kann nur von einem Absender kommen, zwei Quellen von max. zwei Absendern etc. '),
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

Future navigateToPq_input(context) async => Navigator.push(context,
      MaterialPageRoute(builder: (context) => PatientenQ_Input()));

Future navigateToAufgabenHome(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => aufgabeHome()));
