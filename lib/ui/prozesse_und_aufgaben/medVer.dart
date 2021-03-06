import 'package:cirs_app/ui/input_analysis/infoHome.dart';
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

Future navigateToInfoHome(context) async {
  //navigates to information input home page
  Navigator.push(context, MaterialPageRoute(builder: (context) => infoHome()));
}

Widget _medVerList(BuildContext context) {
  // creates list of items found on this page
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Administration'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          navigateToInfoHome(context);
        },
      ),
      ListTile(
          title: Text('Beschaffung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfoHome(context);
          }),
      ListTile(
          title: Text('Reinigung'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfoHome(context);
          }),
      ListTile(
          title: Text('Sterilisation'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            navigateToInfoHome(context);
          }),
      ListTile(
          title: Text('Lagerung'),
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
