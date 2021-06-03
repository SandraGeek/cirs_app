import 'package:cirs_app/ui/prozesse_und_aufgaben/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cirs_app/model/score_data.dart';

import 'fallbericht_erfassen.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CIRS',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  static int index;
  static List<ScoreData> myScoreData = new List(); //creates a new instance (list of score data) each time the application is restarted


  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: appBar(context),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          brightness: Brightness.light,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new MaterialButton(
                height: 80.0,
                minWidth: 150.0,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text(
                  "Fallberichterfassung starten",
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  navigateToFirstPage(context);
                },
              )
            ],
          ),
        ),
      );

  Future navigateToFirstPage(context) async {
    //navigates to fallbericht page
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FallBerichtPage()));
  }
}
