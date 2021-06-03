import 'package:cirs_app/model/score_data.dart';

class PatientOutputData {
  /// This class declares all the characteristics found on the patient (output) page and and sets their respective values
  static int medDomaene_anz;
  static int prioritaet;

  static int calculateScore() {
    /// used to calculate the complexity score of patient (output)
    int score = medDomaene_anz + prioritaet;
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

  static void setPrioritaetValue(String value) {
    if (value == "niedrig") prioritaet = 1;

    if (value == "mittel") prioritaet = 2;

    if (value == "hoch") prioritaet = 3;

    if (value == "keine Angaben") prioritaet = 0;

    if (value == "nicht relevant") prioritaet = 0;
  }
}
