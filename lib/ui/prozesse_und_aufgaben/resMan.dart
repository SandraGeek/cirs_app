import 'package:cirs_app/ui/input_analysis/infoHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class resMan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ressourcen Management"),
        ),
        body: BodyLayoutresMan());
  }
}

class BodyLayoutresMan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _resManList(context);
  }
}

Future navigateToInfoHome(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => infoHome()));
}

Widget _resManList(BuildContext context) {
  // backing data
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Personal Management'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          navigateToInfoHome(context);
        },
      ),
      ListTile(
          title: Text('Service Management'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfoHome(context);
          }),
      ListTile(
          title: Text('Team Management'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfoHome(context);
          }),
      ListTile(
          title: Text('Workload Management'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfoHome(context);
          }),
      ListTile(
          title: Text('SOP, Richtlinien Management'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfoHome(context);
          })
    ],
  );
}
