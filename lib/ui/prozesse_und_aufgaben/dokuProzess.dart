import 'package:cirs_app/ui/input_analysis/infoHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dokuProzess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dokumentationsprozess"),
        ),
        body: BodyLayoutdokuProzess());
  }
}

class BodyLayoutdokuProzess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _dokuProzessList(context);
  }
}

Future navigateToInfoHome(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => infoHome()));
}

Widget _dokuProzessList(BuildContext context) {
  // backing data
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Dokumentenerstellung'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          navigateToInfoHome(context);
        },
      ),
      ListTile(
        title: Text('Kontrolle und Unterschrift'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          navigateToInfoHome(context);
        },
      ),
      ListTile(
          title: Text('Kontrolle'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfoHome(context);
          }),
      ListTile(
          title: Text('NOS'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfoHome(context);
          })
    ],
  );
}
