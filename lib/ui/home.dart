import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cirs_app/model//database_helpers.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CIRS',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Critical Incident Reporting System'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new MaterialButton(
                height: 80.0,
                minWidth: 150.0,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text(
                  "Fallbericht starten",
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  navigateToFirstPage(context);
                },
              )
            ],
          ),
        ),
      );

  Future navigateToFirstPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FallBerichtPage()));
  }
}

class FallBerichtPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fallbericht erfassen'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                _infoButtonPressed(context);
              })
        ],
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              // hack textfield height
              padding: EdgeInsets.only(bottom: 10.0),
              height: 300.0,
              child: TextField(
                maxLines: 20,
                decoration: InputDecoration(
                  hintText: "Was ist passiert?",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            new MaterialButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: new Text("Fallbericht ohne Analyse abgeben"),
              onPressed: () {
                savedAlert(context);
              },
            ),
            new MaterialButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: new Text("Fallbericht analysieren"),
              onPressed: () {
                navigateToProcesses(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> savedAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Vielen Dank!'),
          content: const Text(
              'Einen Feedback wird in den nächsten Tagen veröffentlicht. Bitte behalten Sie die folgende Fallnummer:'),
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

  Future navigateToProcesses(context) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProzesseUndAufgaben()));
  }
}

Future<void> _infoButtonPressed(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Wichtige Info'),
        content: const Text("Was passiert wenn ich ein Fallbericht analysiere oder nicht analsysiere?"),
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

class ProzesseUndAufgaben extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Prozesse und Aufgaben'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.info_outline), onPressed: _tapButton)
        ],
      ),
      body: BodyLayoutPA());

}


_tapButton() {}

class BodyLayoutPA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _PAList(context);
  }
}

Widget _PAList(BuildContext context) {
  // backing data
  return ListView(

    children: <Widget>[
      ListTile(
        title: Text('Allgemeine medizinische Versorgung'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => AllMedVer()));
        },
      ),
      ListTile(
        title: Text('Anwendung von Blut oder Blutprodukten'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('ok');
        },
      ),
      ListTile(
        title: Text('Dokumentationsprozess'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('ok');
        },
      ),
      ListTile(
        title: Text('Anwendung von Blut oder Blutprodukten'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('ok');
        },
      ),
      ListTile(
        title: Text('Ernährung, Diät'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('ok');
        },
      ),
      ListTile(
        title: Text('Infrastruktur- und Gebäudeprozess'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('ok');
        },
      ),
      ListTile(
        title: Text('Administrativer Prozess'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('ok');
        },
      ),
      ListTile(
        title: Text('Klinischer Prozess, Klinischer Prozedur'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('ok');
        },
      ),
      ListTile(
        title: Text('Management medizinischer Geräte'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('ok');
        },
      ),
      ListTile(
        title: Text('Management medizinischer Verbrauchsmaterialen'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('ok');
        },
      ),
      ListTile(
        title: Text('Ressourcen-management'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('ok');
        },
      ),
      ListTile(
        title: Text('Therapeutika, Medikamemente, I.V.-Flüssigkeiten'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('ok');
        },
      ),
    ],
  );
}

class AllMedVer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Allgemeine medizinische Versorgung"),
        ),
        body: BodyLayoutAllMedVer());
  }
}

class BodyLayoutAllMedVer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _AllMedverList(context);
  }
}

Widget _AllMedverList(BuildContext context) {
  // backing data
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Follow up, Routine Checkup'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('ok');
        },
      ),
      ListTile(
        title: Text('Konsultationen, Visite, ärztlicher Patientenkontakt'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('ok');
        },
      ),
      ListTile(
          title: Text('Transport'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('ok');
          }),
      ListTile(
          title: Text('Post-Konsultationen, -Visite'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('ok');
          }),
      ListTile(
          title: Text('Prä-Konsultationen, -Visite'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('ok');
          }),
      ListTile(
          title: Text('Übergabe'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('ok');
          }),
      ListTile(
          title: Text('NOS'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('ok');
          })
    ],
  );
}
