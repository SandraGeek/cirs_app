import 'package:flutter/material.dart';

Widget appBar(BuildContext context){

  return RichText(
    //creates application title shown at the start (first page) of the application
    text: TextSpan(
      style: TextStyle(fontSize: 22),
      children: <TextSpan>[
        TextSpan(text: "CIRS", style: TextStyle
          (fontWeight: FontWeight.w600, color: Colors.black54)),
        TextSpan(text: "medical", style: TextStyle
          (fontWeight: FontWeight.w600, color: Colors.blue)),
      ]
    ),
  );

}