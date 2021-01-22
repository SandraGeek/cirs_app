import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pq_input extends StatefulWidget {
  @override
  _Pq_inputState createState() => _Pq_inputState();
}

class _Pq_inputState extends State<pq_input> {

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text("Patientenqualitätszustand Input"),
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
                  //navigateToProbenmaterial(context);
                },
              )
            ],
          ),
        ),
      );

}


