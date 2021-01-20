import 'package:cirs_app/ui/input_analysis/inputHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class adminProzess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Administrativer Prozess"),
        ),
        body: BodyLayoutadminProzess());
  }
}

class BodyLayoutadminProzess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _adminProzessList(context);
  }
}

Future navigateToInputHome(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => inputHome()));
}

Widget _adminProzessList(BuildContext context) {
  // backing data
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Allokation der Ressourcen'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          navigateToInputHome(context);
        },
      ),
      ListTile(
        title: Text('Antwort auf Notfall'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          navigateToInputHome(context);
        },
      ),
      ListTile(
          title: Text('Aufnahme'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInputHome(context);
          }),
      ListTile(
          title: Text('Einverständniserklärung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInputHome(context);
          }),
      ListTile(
          title: Text('Entlassung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInputHome(context);
          }),
      ListTile(
          title: Text('Konsultation'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInputHome(context);
          }),
      ListTile(
          title: Text('Patientenidentifikation'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInputHome(context);
          }),
      ListTile(
          title: Text('Pflege'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInputHome(context);
          }),
      ListTile(
          title: Text('Terminvergabe'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInputHome(context);
          }),
      ListTile(
          title: Text('Übergabe'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInputHome(context);
          }),
      ListTile(
          title: Text('Warteliste, Warten'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInputHome(context);
          }),
      ListTile(
          title: Text('NOS'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInputHome(context);
          })
    ],
  );
}
