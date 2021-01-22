import 'package:cirs_app/ui/input_analysis/probenmaterial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class patient extends StatelessWidget {
  String _value;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
      title: Text("Angaben zum Patienten"),

    ),
    body: Container (margin: EdgeInsets.all(16.0),

       child: DropdownButton<String>(
         hint: Text("Anzahl der Informationsquellen"),
                 isExpanded: true,
         items: [
           DropdownMenuItem<String>(
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      SizedBox(width: 5,),
      Text("keine Angaben"),
    ],),
    ),

           DropdownMenuItem<String>(
             child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 SizedBox(width: 5,),
                 Text("nicht relevant")
               ],),
           )
         ],


         onChanged: (String value) {

                    },

        // value: _value,




        )
    )
    );
  }
}



