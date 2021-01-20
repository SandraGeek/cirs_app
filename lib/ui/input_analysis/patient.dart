import 'package:cirs_app/ui/input_analysis/inputHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class patient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Patient"),
        ),
        body: BodyLayoutPatient());
  }
}

class BodyLayoutPatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return probenmaterialList(context);
  }
}

Future navigateToInputHome(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => inputHome()));
}

Widget probenmaterialList(BuildContext context) {
  // backing data
  CheckboxListTile(
    title: Text("kein Probenmaterial"),
  );
}
