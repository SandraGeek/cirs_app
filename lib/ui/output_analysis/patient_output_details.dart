import 'dart:ui';
import 'package:cirs_app/ui/output_analysis/proben_output.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class patient_output_details extends StatefulWidget {
  @override
  _Patient_output_detailsState createState() => _Patient_output_detailsState();
}

class _Patient_output_detailsState extends State<patient_output_details> {
  String selected;
  String selected1;
  String selected2;
  String selected3;
  String selected4;

  void onPressed() {


    navigateToProbenOutput(context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("PatientIn als Output"),
      ),
      body:
      Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButtonFormField<String>(

            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Anzahl der medizinischen Domänen",
              labelStyle: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
              isDense: true,
            ),
            value: selected,
            //hint: Text("Anzahl der Informationsquellen"),
            items: ["1", "2", "3 oder mehr", "keine Angaben", "nicht relevant"]
                .map((label) => DropdownMenuItem(
              child: Text(label),
              value: label,
            ))
                .toList(),
            onChanged: (value) {
              setState(() => selected = value);
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Priorität",
              labelStyle: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
              isDense: true,
            ),
            value: selected4,
            // hint: Text("Informationsvolumen"),
            items: ["niedrig", "mittel", "hoch", "keine Angaben", "nicht relevant"]
                .map((label) => DropdownMenuItem(
              child: Text(label),
              value: label,
            ))
                .toList(),
            onChanged: (value) {
              setState(() => selected4 = value);
            },
          ),
        ),
        new RaisedButton(
          child: new Text(
            "Weiter",
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
            ),
          ),
          color: Colors.blue,
          onPressed: onPressed,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
        )
      ]));
}

Future navigateToProbenOutput(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => proben_output()));
}
