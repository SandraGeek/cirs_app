import 'package:cirs_app/ui/input_analysis/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class kProzess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Klinischer Prozess, Klinische Prozedur"),
        ),
        body: BodyLayoutkProzess());
  }
}

class BodyLayoutkProzess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _kProzessList(context);
  }
}

Future navigateToInfo(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => info()));
}

Widget _kProzessList(BuildContext context) {
  // backing data
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Allgemeine Pflege'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          navigateToInfo(context);
        },
      ),
      ListTile(
        title: Text('Durchführung Diagnostik'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          navigateToInfo(context);
        },
      ),
      ListTile(
          title: Text('Durchführung Therapie'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfo(context);
          }),
      ListTile(
          title: Text('Management Laborergebnisse'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfo(context);
          }),
      ListTile(
          title: Text('OP Durchführung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfo(context);
          }),
      ListTile(
          title: Text('OP Vorbereitung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfo(context);
          }),
      ListTile(
          title: Text('Planung Diagnose'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfo(context);
          }),
      ListTile(
          title: Text('Planung Therapie'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfo(context);
          }),
      ListTile(
          title: Text('Postoperative Versorgung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfo(context);
          }),
      ListTile(
          title: Text('Screening, Routine Checkup'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfo(context);
          }),
      ListTile(
          title: Text('NOS'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfo(context);
          })
    ],
  );
}
