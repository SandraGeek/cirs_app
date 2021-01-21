import 'package:cirs_app/ui/input_analysis/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllMedVer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Allgemeine medizinische Versorgung"),
        ),
        body: BodyLayoutAllMedVer());
  }
}

class BodyLayoutAllMedVer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _AllMedverList(context);
  }
}

Future navigateToInfo(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => info()));
}

Widget _AllMedverList(BuildContext context) {
  // backing data
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Follow up, Routine Checkup'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          navigateToInfo(context);
        },
      ),
      ListTile(
        title: Text('Konsultationen, Visite, ärztlicher Patientenkontakt'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          navigateToInfo(context);
        },
      ),
      ListTile(
          title: Text('Transport'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfo(context);
          }),
      ListTile(
          title: Text('Post-Konsultationen, -Visite'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfo(context);
          }),
      ListTile(
          title: Text('Prä-Konsultationen, -Visite'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfo(context);
          }),
      ListTile(
          title: Text('Übergabe'),
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
