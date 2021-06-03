import 'package:cirs_app/model/score_data.dart';

class PatientInputData {
  /// This class declares all the characteristics found on the patient (input) page and and sets their respective values

  static int medDomaene_anz;
  static int domaeneArztZuPat;
  static int haeufigkeit;
  static int kommunikation;
  static int prioritaet;

  static int calculateScore() {
    /// used to calculate the complexity score of patient (input)
    int score = medDomaene_anz +
        domaeneArztZuPat +
        haeufigkeit +
        kommunikation +
        prioritaet;
    return score;
  }

  static ScoreData generateUserDataObjects(
      String pageTitle, int score, barColor) {
    /// used to generate a score data object
    return new ScoreData(pageTitle, score, barColor);
  }

  static void setMedDomaeneAnzValue(String value) {
    if (value == "1") medDomaene_anz = 1;

    if (value == "2") medDomaene_anz = 2;

    if (value == "3 oder mehr") medDomaene_anz = 3;

    if (value == "keine Angaben") medDomaene_anz = 0;

    if (value == "nicht relevant") medDomaene_anz = 0;
  }

  static void setDomaeneArztZuPatValue(String value) {
    if (value == "vollständig") domaeneArztZuPat = 1;

    if (value == "teilweise") domaeneArztZuPat = 2;

    if (value == "keine") domaeneArztZuPat = 3;

    if (value == "keine Angaben") domaeneArztZuPat = 0;

    if (value == "nicht relevant") domaeneArztZuPat = 0;
  }

  static void setHaeufigkeitValue(String value) {
    if (value == "häufig") haeufigkeit = 1;

    if (value == "selten") haeufigkeit = 2;

    if (value == "keine Angaben") haeufigkeit = 0;

    if (value == "nicht relevant") haeufigkeit = 0;
  }

  static void setKommunikationValue(String value) {
    if (value == "normale Kommunikation möglich") kommunikation = 1;

    if (value == "Kommunikation nur über Dritte") kommunikation = 2;

    if (value == "keine Kommunikation möglich") kommunikation = 3;

    if (value == "keine Angaben") kommunikation = 0;

    if (value == "nicht relevant") kommunikation = 0;
  }

  static void setPrioritaetValue(String value) {
    if (value == "niedrig") prioritaet = 1;

    if (value == "mittel") prioritaet = 2;

    if (value == "hoch") prioritaet = 3;

    if (value == "keine Angaben") prioritaet = 0;

    if (value == "nicht relevant") prioritaet = 0;
  }
}
