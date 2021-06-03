import 'package:cirs_app/ui/prozesse_und_aufgaben/resMan.dart';
import 'package:cirs_app/ui/prozesse_und_aufgaben/therMed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'EundD.dart';
import 'InfundGeb.dart';
import 'adminProzess.dart';
import 'allgemeine_med_versorgung.dart';
import 'blutProdukt.dart';
import 'dokuProzess.dart';
import 'kProzess.dart';
import 'medGer.dart';
import 'medVer.dart';

class ProzesseUndAufgaben extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Prozesse und Aufgaben'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline), //shows information icon on app bar
              onPressed: () {
                _infoButtonPressed(context); // // show information icon pop-up message
              })
        ],
      ),
      body: BodyLayoutPA());
}

class BodyLayoutPA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _PAList(context);
  }
}

Widget _PAList(BuildContext context) {

  return ListView(
    // creates list of items found on this page
    children: <Widget>[
      ListTile(
        title: Text('Allgemeine medizinische Versorgung'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => AllMedVer()));
        },
      ),
      ListTile(
        title: Text('Anwendung von Blut oder Blutprodukten'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => blutProdukt()));
        },
      ),
      ListTile(
        title: Text('Dokumentationsprozess'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => dokuProzess()));
        },
      ),
      ListTile(
        title: Text('Ernährung, Diät'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => EundD()));
        },
      ),
      ListTile(
        title: Text('Infrastruktur- und Gebäudeprozess'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => InfundGeb()));
        },
      ),
      ListTile(
        title: Text('Administrativer Prozess'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => adminProzess()));
        },
      ),
      ListTile(
        title: Text('Klinischer Prozess, Klinischer Prozedur'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => kProzess()));
        },
      ),
      ListTile(
        title: Text('Management medizinischer Geräte'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => medGer()));
        },
      ),
      ListTile(
        title: Text('Management medizinischer Verbrauchsmaterialen'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => medVer()));
        },
      ),
      ListTile(
        title: Text('Ressourcen-management'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => resMan()));
        },
      ),
      ListTile(
        title: Text('Therapeutika, Medikamemente, I.V.-Flüssigkeiten'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => therMed()));
        },
      ),
    ],
  );
}

Future<void> _infoButtonPressed(BuildContext context) {
  //creates information icon pop-up message
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Wichtige Info'),
        content:
            const Text("Zu welcher Prozess oder Aufgabe passt Ihr Bericht?"),
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
