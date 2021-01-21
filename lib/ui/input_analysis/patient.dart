import 'package:cirs_app/ui/input_analysis/probenmaterial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class patient extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<patient> {

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text("Angaben zur Patient"),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              new MaterialButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: new Text("Weiter"),
                onPressed: () {
                  navigateToProbenmaterial(context);
                },
              )
            ],
          ),
        ),
      );

}

Future navigateToProbenmaterial(context) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => probenmaterial()));
}
