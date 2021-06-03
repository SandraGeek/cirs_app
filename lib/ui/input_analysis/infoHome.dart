import 'package:cirs_app/ui/input_analysis/patientHome.dart';
import 'infoDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class infoHome extends StatefulWidget {
  @override
  infoHomeState createState() => infoHomeState();
}

class infoHomeState extends State<infoHome> {
  /// This class shows the options needed to provide information data or not
 static int selected;

  void onPressed() {

    if(selected == null){
      // shows pop-up message in case no choice is made
      savedAlert(context);
    }

   else if( selected != 0){
      // navigates to patient home page in case any choice other than "Ja" is made
    navigateToPatientHome(context);

  }
   else if(selected == 0){
      // navigates to information details when "Ja" is chosen
     navigateToInfDetails(context);
   }
  }

  void onChanged(int value) {
    //sets selected option as the list value
    setState(() {
      selected = value;
    });
  }

  List<Widget> infoHomeList() {
    /// creates list of options on information home page
    List<Widget> list = new List<Widget>();
    List options = new List(4);
    options[0] = "Ja";
    options[1] = "keine Information für die Aufgabe nötig";
    options[2] = "keine Angaben";
    options[3] = "Nicht relevant";

    list.add(new Text(
      "Werden für die Aufgabe Informationen verwendet?",
      style: TextStyle(
        //decoration: TextDecoration.underline,
        fontSize: 18,
        color: Colors.blue,
      ),
    ));
    for (int i = 0; i < 4; i++) {
      list.add(new RadioListTile(
        value: i,
        title: Text(options[i]),
        groupValue: selected,
        onChanged: (int value) {
          onChanged(value);
        },
        activeColor: Colors.green,
        //secondary: new Icon(Icons.shopping_basket),
      ));
    }
    list.add(new RaisedButton(
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
    ));

    return list;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Angaben zur Informationsquelle"),
        ),
        body: Center(
          child: new Container(
            width: 500.0,
            height: 500,
            color: Colors.white70,
            alignment: Alignment.center,
            child: new Column(
              children: infoHomeList(),
            ),
          ),
        ),
      );
}

Future<void> savedAlert(BuildContext context) {
  ///creates pop-up message
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Hinweis!'),
        content: const Text(
            'Bitte treffen Sie eine Auswahl!'),
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

Future navigateToPatientHome(context) async => Navigator.push(
  /// navigates to patient home page
    context, MaterialPageRoute(builder: (context) => patientHome()));

Future navigateToInfDetails(context) async => Navigator.push(
  /// navigates to information details page
    context, MaterialPageRoute(builder: (context) => infoDetails()));


