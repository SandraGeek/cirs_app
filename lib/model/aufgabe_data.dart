import 'package:cirs_app/model/complexity_data.dart';
import 'package:cirs_app/model/score_data.dart';

/// This class declares all the characteristics found on the task page and and sets their respective values

class AufgabeData {
  static int prozedur;
  static int kontamination;
  static int medGeraete;
  static int ausbildungsStand;
  static int medMaterial;
  static int anzMedDomaene;
  static int anzPersonen;
  static int kommunikation;
  static int anzInfokanaele;
  static int anzInfoentitaeten;

  static int calculateScore() {
    /// used to calculate the complexity score of the task

    int score = anzMedDomaene +
        anzPersonen +
        kommunikation +
        anzInfokanaele +
        anzInfoentitaeten +
        prozedur +
        kontamination +
        medGeraete +
        ausbildungsStand +
        medMaterial;
    return score;
  }

  static ScoreData generateUserDataObjects(
      String pageTitle, int score, barColor) {
    /// used to generate a score data object

    return new ScoreData(pageTitle, score, barColor);
  }

  static ComplexityData generateUserComplexityObject(
      String pageTitle, String answer) {
    /// used to generate a complexity data object

    return new ComplexityData(pageTitle, answer);
  }

  static void setProzedurValue(String value) {
    if (value == "invasiv") prozedur = 2;

    if (value == "nicht invasiv") prozedur = 1;

    if (value == "keine Angaben") prozedur = 0;

    if (value == "nicht relevant") prozedur = 0;
  }

  static void setkontaminationValue(String value) {
    if (value == "keine Kontaminationsgefahr") kontamination = 0;

    if (value == "latente Kontaminationsgefahr") kontamination = 1;

    if (value == "manifeste Kontaminationsgefahr") kontamination = 2;

    if (value == "keine Angaben") kontamination = 0;

    if (value == "nicht relevant") kontamination = 0;
  }

  static void setMedGeraeteValue(String value) {
    if (value == "keines") medGeraete = 0;

    if (value == "1") medGeraete = 1;

    if (value == "2") medGeraete = 2;

    if (value == "3 oder mehr") medGeraete = 3;

    if (value == "keine Angaben") medGeraete = 0;

    if (value == "nicht relevant") medGeraete = 0;
  }

  static void setMedMaterialValue(String value) {
    if (value == "keines") medMaterial = 0;

    if (value == "1") medMaterial = 1;

    if (value == "2") medMaterial = 2;

    if (value == "3 oder mehr") medMaterial = 3;

    if (value == "keine Angaben") medMaterial = 0;

    if (value == "nicht relevant") medMaterial = 0;
  }

  static void setAusbildungsStandValue(String value) {
    if (value == "PatientIn, Angehörige ") ausbildungsStand = 1;

    if (value == "PraktikantIn") ausbildungsStand = 1;

    if (value == "StudentIn") ausbildungsStand = 2;

    if (value == "GesundheitspflegerIn, MTA, PTA") ausbildungsStand = 3;

    if (value == "FachpflegerIn, FachMTA, FachPTA") ausbildungsStand = 4;

    if (value == "AssistenzaerztIn") ausbildungsStand = 5;

    if (value == "FachaerztIn") ausbildungsStand = 6;

    if (value == "keine Angaben") ausbildungsStand = 0;

    if (value == "nicht relevant") ausbildungsStand = 0;
  }

  static void setAnzMedDomaeneValue(String value) {
    if (value == "1") anzMedDomaene = 1;

    if (value == "2") anzMedDomaene = 2;

    if (value == "3 oder mehr") anzMedDomaene = 3;

    if (value == "keine Angaben") anzMedDomaene = 0;

    if (value == "nicht relevant") anzMedDomaene = 0;
  }

  static void setAnzPersonenValue(String value) {
    if (value == "1") anzPersonen = 1;

    if (value == "2") anzPersonen = 2;

    if (value == "3 oder mehr") anzPersonen = 3;

    if (value == "keine Angaben") anzPersonen = 0;

    if (value == "nicht relevant") anzPersonen = 0;
  }

  static void setKommunikationInternValue(String value) {
    if (value == "gleiche hierarchische Ebene") kommunikation = 1;

    if (value == "unterschiedliche hierarchische Ebenen") kommunikation = 2;

    if (value == "keine Kommunikation") kommunikation = 0;

    if (value == "keine Angaben") kommunikation = 0;

    if (value == "nicht relevant") kommunikation = 0;
  }

  static void setAnzInfokanaeleValue(String value) {
    if (value == "1") anzInfokanaele = 1;

    if (value == "2") anzInfokanaele = 2;

    if (value == "3 oder mehr") anzInfokanaele = 3;

    if (value == "keine Angaben") anzInfokanaele = 0;

    if (value == "nicht relevant") anzInfokanaele = 0;
  }

  static void setAnzInfoEntitaetenValue(String value) {
    if (value == "1") anzInfoentitaeten = 1;

    if (value == "2") anzInfoentitaeten = 2;

    if (value == "3 oder mehr") anzInfoentitaeten = 3;

    if (value == "keine Angaben") anzInfoentitaeten = 0;

    if (value == "nicht relevant") anzInfoentitaeten = 0;
  }
}
