import 'package:cirs_app/model/score_data.dart';
import 'package:cirs_app/model/userData.dart';
import 'package:flutter/material.dart';
import "package:charts_flutter/flutter.dart" as charts;

class Chart extends StatelessWidget {
  /// This class shows the resulting bar chart for a reported or analysed incident

  final List<ScoreData> data = UserData.myScoreData; // creates a list of all saved score data found in the UserData class.

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ScoreData, String>> series = [
      // provides data to be shown on bar chart
      new charts.Series(
          id: "Requirements",
          data: data, //uses the above declared date in the list
          domainFn: (ScoreData series, _) => series.pageTitle, //populates the x-axis
          measureFn: (ScoreData series, _) => series.score, // populates the y-axis
          colorFn: (ScoreData series, _) => series.barColor) // sets the respective bar colours
    ];



    return Scaffold(
        appBar: AppBar(title: Text("Graphische Darstellung"), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline), // shows information icon on app bar
              onPressed: () {
                _infoButtonPressed(context); // show information icon pop-up message
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
                    Expanded(
                      //build bar chart using provided series
                        child: charts.BarChart(
                      series,
                      animate: true,
                      vertical: true, // sets bar chart type (vertical or horizontal)
                      barGroupingType: charts.BarGroupingType.groupedStacked, // sets bar chart grouping type (stacked to display grey and other colours stacked together)
                      domainAxis: charts.OrdinalAxisSpec(
                          renderSpec:
                              charts.SmallTickRendererSpec(labelRotation: 60)),
                      behaviors: [
                        //sets the name or title of the x-axis and y-axis
                        new charts.ChartTitle("Komponent",
                            behaviorPosition: charts.BehaviorPosition.bottom,
                            titleOutsideJustification:
                                charts.OutsideJustification.middle),
                        new charts.ChartTitle("Score",
                            behaviorPosition: charts.BehaviorPosition.start,
                            titleOutsideJustification:
                                charts.OutsideJustification.middle)
                      ],
                    ))
                  ],
                ),
              ),
            )));
  }



  Future<void> _infoButtonPressed(BuildContext context) {
    //creates information icon pop-up message
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Wichtige Info'),
          content: const Text(
              "Die hier dargestellte Graph zeigt Ihnen die Komplexitätsscore"
                  " der von Ihnen angegeben Daten. Je höher der Score desto höher, "
                  "mittelmäßiger oder geringer der Risikoprofil. "),
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

