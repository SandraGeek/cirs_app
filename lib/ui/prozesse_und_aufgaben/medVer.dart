import 'package:cirs_app/ui/input_analysis/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class medVer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Management medizinischer Verbrauchsmaterialien"),
        ),
        body: BodyLayoutmedVer());
  }
}

class BodyLayoutmedVer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _medVerList(context);
  }
}

Future navigateToInfo(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => info()));
}

Widget _medVerList(BuildContext context) {
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
          title: Text('Beschaffung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfo(context);
          }),
      ListTile(
          title: Text('Reinigung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfo(context);
          }),
      ListTile(
          title: Text('Sterilisation'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfo(context);
          }),
      ListTile(
          title: Text('Lagerung'),
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
