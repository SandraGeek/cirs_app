import 'package:cirs_app/ui/input_analysis/infoHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/info_options.dart';

class info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<info> {

  String selected;

  List<info_options> options;
  info_options selectedOption;
  int selectedRadio;
  int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
    options = info_options.getInfo_options();
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  setSelectedOption(info_options option) {
    setState(() {
      selectedOption = option;
    });
  }

  List<Widget> createRadioListUsers() {
    List<Widget> widgets = [];
    for (info_options option in options) {
      widgets.add(
        RadioListTile(
          value: option,
          groupValue: selectedOption,
          title: Text(option.option),
          onChanged: (currentOption) {
            print("Current Option: ${currentOption.option}");
            setSelectedOption(currentOption);
          },
          selected: selectedOption == option,
          activeColor: Colors.green,

        ),
      );

    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Angaben zur Informationsquelle"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: createRadioListUsers(),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<String>(

                decoration: InputDecoration(border: OutlineInputBorder()),
                value: selected,
                hint: Text("Anzahl der Informationsquellen"),
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

            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              new MaterialButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: new Text("Weiter"),
                onPressed: () {
                  navigateToInfoHome(context);
                },
              ),
            ]),
        ],
      ));
}

Future navigateToInfoHome(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => infoHome()));
}
