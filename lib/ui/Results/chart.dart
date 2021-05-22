import 'package:cirs_app/model/score_data.dart';
import 'package:cirs_app/model/userData.dart';
import 'package:flutter/material.dart';
import "package:charts_flutter/flutter.dart" as charts;



class Chart extends StatelessWidget {
  final List<ScoreData> data = UserData.myScoreData;

  @override
  Widget build(BuildContext context) {

        List<charts.Series<ScoreData, String>> series = [
      charts.Series(
          id: "Requirements",
          data: data,
          domainFn: (ScoreData series, _) => series.pageTitle,
          measureFn: (ScoreData series, _) => series.score,
          colorFn: (ScoreData series, _) => series.barColor
      )
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text("Graphische Darstellung"),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.info_outline),
                  onPressed: () {
                    _infoButtonPressed(context);
                  })
            ]),

            body: Container(
        height: 500,
        padding: EdgeInsets.all(20),
    child: Card(
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Text(
          'Komplexitätsscore',
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
    Expanded(child: charts.BarChart(series, animate: true, domainAxis: charts.OrdinalAxisSpec(
      renderSpec: charts.SmallTickRendererSpec(labelRotation: 60)), behaviors: [
        new charts.ChartTitle("Komponent", behaviorPosition: charts.BehaviorPosition.bottom, titleOutsideJustification: charts.OutsideJustification.middle),
      new charts.ChartTitle("Score", behaviorPosition: charts.BehaviorPosition.start, titleOutsideJustification: charts.OutsideJustification.middle)
    ],))],
    ),
    ),
    )
    )
    );
  }

  Future<void> _infoButtonPressed(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Wichtige Info'),
          content:
          const Text("Die hier dargestellte Graph zeigt Ihnen die Komplexitätsscore der von Ihnen angegeben Daten. Je höher der Score desto höher, mittelmäßiger oder geringer der Risikoprofil. "),
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
