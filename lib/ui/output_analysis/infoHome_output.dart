import 'package:cirs_app/ui/output_analysis/info_output_details.dart';
import 'package:cirs_app/ui/output_analysis/patientHome_output.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class infoHome_output extends StatefulWidget {
  @override
  info_OutputState createState() => info_OutputState();
}

class info_OutputState extends State<infoHome_output> {
 static int selected;

  void onPressed() {

    if(selected == null){
      savedAlert(context);
    }
    else if( selected != 0){
      navigateToPatientOutput(context);

    }
    else if(selected==0){
      navigateToInfo_output_details(context);
    }
  }

  void onChanged(int value) {
    setState(() {
      selected = value;
    });
  }

  List<Widget> info_outputList() {
    List<Widget> list = new List<Widget>();
    List names = new List(4);
    names[0] = "Ja";
    names[1] = "keine Information als Output";
    names[2] = "keine Angabe";
    names[3] = "Nicht relevant";

    list.add(new Text(
      "Sind Informationen (Berichte, Befunde, u.a.) Bestandteil des Ergebnisses der Aufgabe?",
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
      title: Text("Information als Output"),
    ),
    body: Center(
      child: new Container(
        width: 500.0,
        height: 500,
        color: Colors.white70,
        alignment: Alignment.center,
        child: new Column(
          children: info_outputList(),
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

Future navigateToPatientOutput(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => patientHome_output()));

Future navigateToInfo_output_details(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => info_output_details()));


