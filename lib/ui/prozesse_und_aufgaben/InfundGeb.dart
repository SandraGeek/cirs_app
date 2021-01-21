import 'package:cirs_app/ui/input_analysis/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfundGeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Infrastruktur- und Gebäudeprozess"),
        ),
        body: BodyLayoutInfundGeb());
  }
}

class BodyLayoutInfundGeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _InfundGebList(context);
  }
}

Future navigateToInfo(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => info()));
}

Widget _InfundGebList(BuildContext context) {
  // backing data
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Administration'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          navigateToInfo(context);
        },
      ),
      ListTile(
        title: Text('Reinigung'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          navigateToInfo(context);
        },
      ),
      ListTile(
          title: Text('Sterilisation'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfo(context);
          }),
      ListTile(
          title: Text('Wartung'),
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
