import 'package:cirs_app/ui/input_analysis/infoHome.dart';
import 'package:cirs_app/ui/input_analysis/probenDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class probenHome extends StatefulWidget {
  @override
  _ProbenHomeState createState() => _ProbenHomeState();
}

class _ProbenHomeState extends State<probenHome> {

  int _selected;

  void onPressed() {

    if(_selected == null){
      savedAlert(context);
    }
    else if( _selected != 0){
      //ToDo check dependencies infoHome and patientHome
      navigateToProbenDetails(context);

    }
    else if(_selected==0){
      navigateToProbenDetails(context);
    }
  }

   void onChanged(int value) {
    setState(() {
      _selected = value;
    });
  }

  List<Widget> probenHomeList() {
    List<Widget> list = new List<Widget>();
    List names = new List(4);
    names[0] = "Ja";
    names[1] = "kein Probenmaterial";
    names[2] = "keine Angaben";
    names[3] = "Nicht relevant";

    list.add(new Text(
      "Sind Probenmaterial/Medikamenten vorhanden?",
      style: TextStyle(
        //decoration: TextDecoration.underline,
        fontSize: 18,
        color: Colors.blue,
      ),
    ));
    for (int i = 0; i < 4; i++) {
      list.add(new RadioListTile(
        value: i,
        title: Text(names[i]),
        groupValue: _selected,
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
      title: Text("Angaben zu Probenmaterial"),
    ),
    body: Center(
      child: new Container(
        width: 500.0,
        height: 500,
        color: Colors.white70,
        alignment: Alignment.center,
        child: new Column(
          children: probenHomeList(),
        ),
      ),
    ),
  );
}

Future<void> savedAlert(BuildContext context) {
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

Future navigateToProbenDetails(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => probenDetails()));

Future navigateToInfoHome(context) async => Navigator.push(
    context, MaterialPageRoute(builder: (context) => infoHome()));


