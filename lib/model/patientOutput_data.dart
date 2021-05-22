import 'package:cirs_app/model/score_data.dart';



class PatientOutputData {


  static int medDomaene_anz;
  static int prioritaet;


  static int calculateScore() {

    int score = medDomaene_anz + prioritaet;
    return score;
  }

  static ScoreData generateUserDataObjects(String pageTitle, int score, barColor) {

    return new ScoreData(pageTitle, score, barColor);

  }


  static void setMedDomaeneAnzValue(String value) {

    if (value == "1")
      medDomaene_anz = 1;

    if (value == "2")
      medDomaene_anz = 2;

    if (value == "3 oder mehr")
      medDomaene_anz = 3;

    if (value == "keine Angaben")
      medDomaene_anz = 0;

    if (value == "nicht relevant")
      medDomaene_anz = 0;

  }

  static void setPrioritaetValue(String value) {

    if (value == "niedrig")
      prioritaet = 1;

    if (value == "mittel")
      prioritaet = 2;

    if (value == "hoch")
      prioritaet = 3;

    if (value == "keine Angaben")
      prioritaet = 0;

    if (value == "nicht relevant")
      prioritaet = 0;

  }


}