import 'package:cirs_app/ui/output_analysis/pq_output.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class proben_output_details extends StatefulWidget {
  @override
  _Proben_output_detailsState createState() => _Proben_output_detailsState();
}

class _Proben_output_detailsState extends State<proben_output_details> {

  String selected;
  String selected1;

  void onPressed() {

    if(selected == 1 && selected1 == 2) {
      savedAlert(context);
    }//|| (selected == 2 || selected1 == 1 && selected1 == 2)|| (selected == 2 || selected1 == 1 && selected1 == 2 && selected1 == 3){

    else{
      navigateToPq_output(context);
    }


  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Probenmaterial/Medikamenten als Output"),
      ),
      body:
      Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: DropdownButtonFormField<String>(
            //, itemHeight: 2,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Anzahl der Probenitems/Medikamente",
              labelStyle: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
              isDense: true,
            ),
            value: selected,
            //hint: Text("Anzahl der Informationsquellen"),
            items: ["1", "2", "3 oder mehr", "keine Angabe", "nicht relevant"]
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
              labelText: "Anzahl der Absender",
              labelStyle: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
              isDense: true,
            ),
            value: selected1,
            // hint: Text("Informationsvolumen"),
            items: ["1", "2", "3", "keine Angabe", "nicht relevant"]
                .map((label) => DropdownMenuItem(
              child: Text(label),
              value: label,
            ))
                .toList(),
            onChanged: (value) {
              setState(() => selected1 = value);
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

Future<void> savedAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Vielen Dank!'),
        content: const Text(
            'Ein Feedback wird in den nächsten Tagen veröffentlicht.'),
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

Future navigateToPq_output(context) async => Navigator.push(context,
    MaterialPageRoute(builder: (context) => pq_output()));
