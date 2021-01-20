import 'package:cirs_app/ui/prozesse_und_aufgaben/prozesse_und_aufgaben.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FallBerichtPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fallbericht erfassen'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                _infoButtonPressed(context);
              })
        ],
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              // hack textfield height
              padding: EdgeInsets.only(bottom: 10.0),
              height: 200.0,
              child: TextField(
                maxLines: 20,
                decoration: InputDecoration(
                  hintText: "Was ist passiert?",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            new MaterialButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: new Text("Fallbericht ohne Analyse abgeben"),
              onPressed: () {
                savedAlert(context);
              },
            ),
            new MaterialButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: new Text("Fallbericht abgeben und analysieren"),
              onPressed: () {
                navigateToProcesses(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> savedAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Vielen Dank!'),
          content: const Text(
              'Ein Feedback wird in den nächsten Tagen veröffentlicht.'),
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

  Future navigateToProcesses(context) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProzesseUndAufgaben()));
  }
}

Future<void> _infoButtonPressed(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Wichtige Info'),
        content: const Text(
            "Was passiert wenn ich ein Fallbericht analysiere oder nicht analsysiere?"),
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
