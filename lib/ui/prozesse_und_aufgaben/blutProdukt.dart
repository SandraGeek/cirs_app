import 'package:cirs_app/ui/input_analysis/infoHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class blutProdukt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Anwendung von Blut oder Blutprodukten"),
        ),
        body: BodyLayoutblutProdukt());
  }
}

class BodyLayoutblutProdukt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _blutproduktList(context);
  }
}

Future navigateToInfoHome(context) async {
  //navigates to information input home page
  Navigator.push(context, MaterialPageRoute(builder: (context) => infoHome()));
}

Widget _blutproduktList(BuildContext context) {
  // backing data
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Abgabe, Transport, Anlieferung'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          navigateToInfoHome(context);
        },
      ),
      ListTile(
        title: Text('Administration'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          navigateToInfoHome(context);
        },
      ),
      ListTile(
          title: Text('Aufbewahrung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfoHome(context);
          }),
      ListTile(
          title: Text('Bestellung, Order'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfoHome(context);
          }),
      ListTile(
          title: Text('Monitoring, Überwachung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfoHome(context);
          }),
      ListTile(
          title: Text('Vortransfusionstestung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfoHome(context);
          }),
      ListTile(
          title: Text('Verpackung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfoHome(context);
          }),
      ListTile(
          title: Text('Verschreibung, Anordnung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfoHome(context);
          }),
      ListTile(
          title: Text('Vorbereitung zur Transfusion'),
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
