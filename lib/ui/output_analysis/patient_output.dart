import 'package:cirs_app/ui/output_analysis/patient_output_details.dart';
import 'package:cirs_app/ui/output_analysis/proben_output.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class patient_output extends StatefulWidget {
  @override
  _patient_outputState createState() => _patient_outputState();
}

class _patient_outputState extends State<patient_output> {
  int _selected;

  void onPressed() {

    if(_selected == null){
      savedAlert(context);
    }
    else if( _selected != 0){
      navigateToProbenOutputDetails(context);

    }
    else if(_selected==0){
      navigateToPatient_output_details(context);
    }
  }

  void onChanged(int value) {
    setState(() {
      _selected = value;
    });
  }

  List<Widget> patient_outputList() {
    List<Widget> list = new List<Widget>();
    List names = new List(4);
    names[0] = "Ja";
    names[1] = "kein PatientIn als Output";
    names[2] = "keine Angabe";
    names[3] = "Nicht relevant";

    list.add(new Text(
      "Ist ein Patient Bestandteil des Ergebnisses der Aufgabe?",
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
        groupValue: _selected,
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
      title: Text("PatientIn als Output"),
    ),
    body: Center(
      child: new Container(
        width: 500.0,
        height: 500,
        color: Colors.white70,
        alignment: Alignment.center,
        child: new Column(
          children: patient_outputList(),
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
        content: const Text(
            'Bitte treffen Sie eine Auswahl!'),
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

Future navigateToProbenOutputDetails(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => proben_output()));

Future navigateToPatient_output_details(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => patient_output_details()));


