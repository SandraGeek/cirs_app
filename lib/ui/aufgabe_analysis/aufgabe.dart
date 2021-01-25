import 'dart:ui';
import 'package:cirs_app/ui/aufgabe_analysis/res_quality.dart';
import 'package:cirs_app/ui/output_analysis/info_output.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class aufgabe extends StatefulWidget {
  @override
  _AufgabeState createState() => _AufgabeState();
}
enum dqOption { first, second, third }

class _AufgabeState extends State<aufgabe> {
  String selected;
  String selected1;
  String selected2;
  String selected3;
  String selected4;
  String selected5;
  String selected6;
  String selected7;
  dqOption _option;


  void onPressed() {
    navigateResQ(context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Aufgabe"),
      ),
      body: SafeArea(
          child: Scrollbar(

              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        RadioListTile<dqOption>(
                          title: const Text('keine Aufgabe'),
                          value: dqOption.first,
                          groupValue: _option,
                          onChanged: (dqOption value) {
                            setState(() {
                              _option = value;
                            });
                            navigateToInfo_Output(context);
                          },
                        ),
                        RadioListTile<dqOption>(
                          title: const Text('keine Angaben zur Aufgabe'),
                          value: dqOption.second,
                          groupValue: _option,
                          onChanged: (dqOption value) {
                            setState(() {
                              _option = value;
                            });
                            navigateToInfo_Output(context);
                          },
                        ),
                        RadioListTile<dqOption>(
                          title: const Text('nicht relevant'),
                          value: dqOption.third,
                          groupValue: _option,
                          onChanged: (dqOption value) {
                            setState(() {
                              _option = value;
                            });
                            navigateToInfo_Output(context);
                          },
                        ),

                        new Text(
                          'Prozedur:',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Art der Prozedur",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                              isDense: true,
                            ),
                            value: selected,
                            //hint: Text("Anzahl der Informationsquellen"),
                            items:
                            ["invasiv", "nicht invasiv", "keine Angaben", "nicht relevant"]
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
                              labelText: "Kontaminationsgefahr",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                              isDense: true,
                            ),
                            value: selected1,
                            //hint: Text("Anzahl der Absender"),
                            items:
                            ["keine Kontaminationsgefahr", "latente Kontaminationsgefahr", "manifeste Kontaminationsgefahr", "keine Angaben", "nicht relevant"]
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Benutzung von medizinischen Geräten",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                              isDense: true,
                            ),
                            value: selected2,
                            // hint: Text("Form des Informationsaustausches"),
                            items: [
                              "keines", "1", "2", "3 oder mehr", "keine Angaben", "nicht relevant"
                            ]
                                .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                                .toList(),
                            onChanged: (value) {
                              setState(() => selected2 = value);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Notwendiger Ausbildungsstand",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                              isDense: true,
                            ),
                            value: selected3,
                            // hint: Text("Informationstyp und strukturiertheit"),
                            items: [
                             "PatientIn, Angehörige", "PraktikantIn", "StudentIn", "GesundheitspflegerIn, MTA, PTA", "FachpflegerIn, FachMTA, FachPTA","AssistenzaerztIn" , "FachaerztIn",
                              "keine Angaben", "nicht relevant"
                            ]
                                .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                                .toList(),
                            onChanged: (value) {
                              setState(() => selected3 = value);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Benutzung von medizinischem Verbrauchsmaterial",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                              isDense: true,
                            ),
                            value: selected4,
                            // hint: Text("Informationsvolumen"),
                            items: [ "keines", "1", "2", "3 oder mehr", "keine Angaben", "nicht relevant"]
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Anzahl involvierter medizinischer Domänen",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                              isDense: true,
                            ),
                            value: selected5,
                            // hint: Text("Informationsvolumen"),
                            items: [ "1", "2", "3 oder mehr", "keine Angaben", "nicht relevant"]
                                .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                                .toList(),
                            onChanged: (value) {
                              setState(() => selected5 = value);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Anzahl involvierter Personen",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                              isDense: true,
                            ),
                            value: selected5,
                            // hint: Text("Informationsvolumen"),
                            items: [ "1", "2", "3 oder mehr", "keine Angaben", "nicht relevant"]
                                .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                                .toList(),
                            onChanged: (value) {
                              setState(() => selected5 = value);
                            },
                          ),
                        ),
                        new Text(
                          'Kommunikation & Monitoring:',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Interne Teamkommunikation",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                              isDense: true,
                            ),
                            value: selected5,
                            // hint: Text("Informationsvolumen"),
                            items: [ "gleiche hierarchische Ebene", "unterschiedlcihe hierarchische Ebenen", "keine Kommunikation", "keine Angaben", "nicht relevant"]
                                .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                                .toList(),
                            onChanged: (value) {
                              setState(() => selected5 = value);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Anzahl verfügbarer Informationskanäle",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                              isDense: true,
                            ),
                            value: selected5,
                            // hint: Text("Informationsvolumen"),
                            items: [ "1", "2", "3 oder mehr", "keine Angaben", "nicht relevant"]
                                .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                                .toList(),
                            onChanged: (value) {
                              setState(() => selected5 = value);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Anzahl notwendiger Informationsentitäten",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                              isDense: true,
                            ),
                            value: selected5,
                            // hint: Text("Informationsvolumen"),
                            items: [ "1", "2", "3 oder mehr", "keine Angaben", "nicht relevant"]
                                .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                                .toList(),
                            onChanged: (value) {
                              setState(() => selected5 = value);
                            },
                          ),
                        ),
                        new RaisedButton(
                          child: new Text(
                            "Weiter",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.blue,
                          onPressed: onPressed,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                        )
                      ]
                  )
              )
          )
      )
  );
}

Future navigateToInfo_Output(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => info_output()));
}

Future navigateResQ(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => res_quality()));
}
