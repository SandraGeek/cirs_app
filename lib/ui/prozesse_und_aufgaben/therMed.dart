import 'package:cirs_app/ui/input_analysis/inputHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class therMed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Therapeutika, Medikamemente, I.V.-Flüssigkeiten"),
        ),
        body: BodyLayouttherMed());
  }
}

class BodyLayouttherMed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _therMedList(context);
  }
}

Future navigateToInputHome(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => inputHome()));
}

Widget _therMedList(BuildContext context) {
  // backing data
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Administration'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          navigateToInputHome(context);
        },
      ),
      ListTile(
          title: Text('Aufbewahrung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInputHome(context);
          }),
      ListTile(
          title: Text('Abgabe, Transport, Anlieferung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInputHome(context);
          }),
      ListTile(
          title: Text('Bestellung, Order'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInputHome(context);
          }),
      ListTile(
          title: Text('Monitoring'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInputHome(context);
          }),
      ListTile(
          title: Text('Verschreibung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInputHome(context);
          }),
      ListTile(
          title: Text('Vorbereitung, Aufbereitung, Bereitstellung'),
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
