import 'package:cirs_app/model/complexity_data.dart';
import 'package:cirs_app/model/score_data.dart';


class PatientenQInputData {
  static int adminIdent;
  static int persIdent;
  static int lokalIdent;
  static int planungDiagnose;
  static int diagnose;
  static int planungTherapie;
  static int therapieDurch;
  static int kontamination;
  static int allgemines;
  static int abs_empf;
  static int patIdent;
  static int diagnoseDoku;
  static int klinischeGesch;
  static int therapie;


  static int calculateScore() {

    int score = planungTherapie + therapieDurch +kontamination + allgemines + abs_empf + patIdent + diagnoseDoku + klinischeGesch + therapie +
        adminIdent + persIdent + lokalIdent + planungDiagnose + diagnose;
    return score;
  }

   static ScoreData generateUserDataObjects(String pageTitle, int score) {

   return new ScoreData(pageTitle, score);

  }

   static ComplexityData generateUserComplexityObject(String pageTitle, String answer) {

    return new ComplexityData(pageTitle, answer);

  }


  static void setAdminIdentValue(String value) {
    if (value == "richtig, vollständig")
      adminIdent = 1;

    if (value == "richtig, unvollständig")
      adminIdent = 2;

    if (value == "keine Angaben")
      adminIdent = 0;

    if (value == "nicht relevant")
      adminIdent = 0;

    if (value == "falsch")
      adminIdent = 3;

    if (value == "fehlend")
      adminIdent = 3;
  }

   static void setPersIdentValue(String value) {
    if (value == "richtig, vollständig")
      persIdent = 1;

    if (value == "richtig, unvollständig")
      persIdent = 2;

    if (value == "keine Angaben")
      persIdent = 0;

    if (value == "nicht relevant")
      persIdent = 0;

    if (value == "fehlend")
      persIdent = 3;

    if (value == "falsch")
      persIdent = 3;
  }

  static void setLokalIdentValue(String value) {
    if (value == "richtig, vollständig")
      lokalIdent = 1;

    if (value == "richtig, unvollständig")
      lokalIdent = 2;

    if (value == "keine Angaben")
      lokalIdent = 0;

    if (value == "nicht relevant")
      lokalIdent = 0;

    if (value == "fehlend")
      lokalIdent = 3;

    if (value == "falsch")
      lokalIdent = 3;
  }

 static void setPlanungDiagnoseValue(String value) {
    if (value == "richtig, vollständig")
      planungDiagnose = 1;

    if (value == "richtig, unvollständig")
      planungDiagnose = 2;

    if (value == "zeitlich verzögert")
      planungDiagnose = 2;

    if (value == "keine Angaben")
      planungDiagnose = 0;

    if (value == "nicht relevant")
      planungDiagnose = 0;

    if (value == "falsch")
      planungDiagnose = 3;
  }

  static void setDiagnoseValue(String value) {
    if (value == "richtig, vollständig")
      diagnose = 1;

    if (value == "richtig, unvollständig")
      diagnose = 2;

    if (value == "zeitlich verzögert")
      diagnose = 2;

    if (value == "keine Angaben")
      diagnose = 0;

    if (value == "nicht relevant")
      diagnose = 0;

    if (value == "falsch")
      diagnose = 3;
  }

 static void setPlanungTherapieValue(String value) {
    if (value == "richtig, vollständig")
      planungTherapie = 1;

    if (value == "richtig, unvollständig")
      planungTherapie = 2;

    if (value == "zeitlich verzögert")
      planungTherapie = 2;

    if (value == "keine Angaben")
      planungTherapie = 0;

    if (value == "nicht relevant")
      planungTherapie = 0;

    if (value == "falsch")
      planungTherapie = 3;
  }

  static void setTherapieDurchValue(String value) {
    if (value == "richtig, vollständig")
      therapieDurch = 1;

    if (value == "richtig, unvollständig")
      therapieDurch = 2;

    if (value == "zeitlich verzögert")
      therapieDurch = 2;

    if (value == "keine Angaben")
      therapieDurch = 0;

    if (value == "nicht relevant")
      therapieDurch = 0;

    if (value == "falsch, NOS")
      therapieDurch = 3;

  }

  static void setKontaminationValue(String value) {
    
    if (value == "keine Angaben")
      kontamination = 0;

    if (value == "nicht relevant")
      kontamination = 0;

    if (value == "kontaminiert")
      kontamination = 2;

    if (value == "potentiell kontaminiert")
      kontamination = 2;

    if (value == "keine Kontamination")
      kontamination = 1;
  }

  static void setAllgemeinesValue(String value) {
    if (value == "richtig, vollständig")
      allgemines = 1;

    if (value == "richtig, unvollständig, NOS")
      allgemines = 2;

    if (value == "keine Angaben")
      allgemines = 0;

    if (value == "nicht relevant")
      allgemines = 0;

    if (value == "fehlend")
      allgemines = 3;

    if (value == "falsch")
      allgemines = 3;

    }


  static void setAbs_EmpfValue(String value) {
    if (value == "Absender richtig, vollständig")
      abs_empf = 1;

    if (value == "Absender richtig, unvollständig")
      abs_empf = 2;

    if (value == "Adressat richtig, vollständig")
      abs_empf = 1;

    if (value == "Adressat richtig, unvollständig")
      abs_empf = 2;

    if (value == "keine Angaben zum Adressat")
      abs_empf = 0;

    if (value == "keine Angaben zum Absender")
      abs_empf = 0;

    if (value == "Adressat nicht relevant")
      abs_empf = 0;

    if (value == "Absender nicht relevant")
      abs_empf = 0;

    if (value == "Absender fehlend")
      abs_empf = 3;

    if (value == "Adressat fehlend")
      abs_empf = 3;

    if (value == "falsche Absender")
      abs_empf = 3;

    if (value == "falsche Adressat")
      abs_empf = 3;

   }

  static void setPatIdentValue(String value) {
    if (value == "richtig, vollständig")
      patIdent = 1;

    if (value == "richtig, unvollständig")
      patIdent = 2;

    if (value == "keine Angaben")
      patIdent = 0;

    if (value == "nicht relevant")
      patIdent = 0;

    if (value == "fehlend")
      patIdent = 3;

    if (value == "falsch")
      patIdent = 3;

  }

  static void setDiagnoseDokuValue(String value) {
    if (value == "richtig, vollständig")
      diagnoseDoku = 1;

    if (value == "richtig, unvollständig")
      diagnoseDoku = 2;

    if (value == "zeitlich verzögert")
      diagnoseDoku = 2;

    if (value == "keine Angaben")
      diagnoseDoku = 0;

    if (value == "nicht relevant")
      diagnoseDoku = 0;

    if (value == "falsch")
      diagnoseDoku = 3;
  }

  static void setKlinischeGeschValue(String value) {
    if (value == "richtig, vollständig")
      klinischeGesch = 1;

    if (value == "richtig, unvollständig")
      klinischeGesch = 2;

    if (value == "zeitlich verzögert")
      klinischeGesch = 2;

    if (value == "keine Angaben")
      klinischeGesch = 0;

    if (value == "nicht relevant")
      klinischeGesch = 0;

    if (value == "falsch")
      klinischeGesch = 3;
  }

  static void setTherapieValue(String value) {
    if (value == "richtig, vollständig")
      therapie = 1;

    if (value == "richtig, unvollständig")
      therapie = 2;

    if (value == "zeitlich verzögert")
      therapie = 2;

    if (value == "keine Angaben")
      therapie = 0;

    if (value == "nicht relevant")
      therapie = 0;

    if (value == "falsch")
      therapie = 3;
  }

}
