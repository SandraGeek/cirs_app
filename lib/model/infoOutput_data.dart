import 'package:cirs_app/model/complexity_data.dart';
import 'package:cirs_app/model/score_data.dart';



class InfoOutputData {


  static int infoQuelle_anz;
  static int empfaenger_anz;
  static int form_des_infoaustausches;
  static int infotyp_und_struktur;
  static int infoVolumen;


  static int calculateScore() {

    int score = infoQuelle_anz + empfaenger_anz + form_des_infoaustausches + infotyp_und_struktur + infoVolumen;
    return score;
  }

  static ScoreData generateUserDataObjects(String pageTitle, int score, barColor) {

    return new ScoreData(pageTitle, score, barColor);

  }

  static ComplexityData generateUserComplexityObject(String pageTitle, String answer) {

    return new ComplexityData(pageTitle, answer);

  }

  static void setInfoQuelleAnzValue(String value) {

    if (value == "1")
      infoQuelle_anz = 1;

    if (value == "2")
      infoQuelle_anz = 2;

    if (value == "3 oder mehr")
      infoQuelle_anz = 3;

    if (value == "keine Angaben")
      infoQuelle_anz = 0;

    if (value == "nicht relevant")
      infoQuelle_anz = 0;

  }

  static void setEmpfaengerAnzValue(String value) {

    if (value == "1")
      empfaenger_anz = 1;

    if (value == "2")
      empfaenger_anz = 2;

    if (value == "3 oder mehr")
      empfaenger_anz = 3;

    if (value == "keine Angaben")
      empfaenger_anz = 0;

    if (value == "nicht relevant")
      empfaenger_anz = 0;

  }

  static void setInfoAustauschFormValue(String value) {

    if (value == "einzeln")
      form_des_infoaustausches = 1;

    if (value == "sequentiell")
      form_des_infoaustausches = 2;

    if (value == "quasi gleichzeitig")
      form_des_infoaustausches = 3;

    if (value == "keine Angaben")
      form_des_infoaustausches = 0;

    if (value == "nicht relevant")
      form_des_infoaustausches = 0;

  }

  static void setInfoTypUndStrukturValue(String value) {

    if (value == "strukturiert digital")
      infotyp_und_struktur = 1;

    if (value == "unstrukturiert digital")
      infotyp_und_struktur = 2;

    if (value == "strukturiert gedruckt")
      infotyp_und_struktur = 3;

    if (value == "unstrukturiert gedruckt")
      infotyp_und_struktur = 4;

    if (value == "strukturiert handschriftlich")
      infotyp_und_struktur = 5;

    if (value == "unstrukturiert handschriftlich")
      infotyp_und_struktur = 6;

    if (value == "strukturiert gesprochen")
      infotyp_und_struktur = 7;

    if (value == "unstrukturiert gesprochen")
      infotyp_und_struktur = 8;

    if (value == "keine Angaben")
      infotyp_und_struktur = 0;

    if (value == "nicht relevant")
      infotyp_und_struktur = 0;

  }

  static void setInfoVolumenValue(String value) {

    if (value == "gering")
      infoVolumen = 1;

    if (value == "gross")
      infoVolumen = 2;

    if (value == "keine Angaben")
      infoVolumen = 0;

    if (value == "nicht relevant")
      infoVolumen = 0;

  }

}