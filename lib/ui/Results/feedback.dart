import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cirs_app/ui/Results/chart.dart';
import 'package:cirs_app/model/userData.dart';

String pageTitle = "Ergebnisse der Analyse";

class feedback extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<feedback> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(pageTitle),
        actions: <Widget>[
            IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () {
                  _infoButtonPressed(context);
                })
          ]),

        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Text(
              'Komplexität der Aufgabe',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Expanded(
          child: DataTable(
          columns: const <DataColumn>[
          DataColumn(
          label: Text(
          'Merkmal',
          style: TextStyle(fontStyle: FontStyle.italic),
          ),
          ),
          DataColumn(
          label: Text(
          'Value',
          style: TextStyle(fontStyle: FontStyle.italic),
          ),
          ),
          ],
          rows: List<DataRow>.generate(
          UserData.myComplexityData.length,
          (int index) => DataRow(
          cells: <DataCell>[
          DataCell(Text(UserData.myComplexityData[index].questionTitle)),
    DataCell(Text(UserData.myComplexityData[index].questionAnswer))
    ])))),
          RaisedButton(
            child: Text("Graphische Darstellung anzeigen", style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            )),color: Colors.blue,
            onPressed: () {
              navigateToChart(context);
            },
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
          ),
        ],


        )
    );
  }


  Future navigateToChart(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Chart()));
  }

  Future<void> _infoButtonPressed(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Wichtige Info'),
          content:
          const Text("Die hier dargestellte Ergebnis zeigt Ihnen welche Merkmale, zur Komplexität der Aufgabe beigetragen hat! "),
          actions: <Widget>[
            TextButton(
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
}
