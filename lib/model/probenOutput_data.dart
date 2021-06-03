import 'package:cirs_app/model/score_data.dart';

class ProbenOutputData {
  /// This class declares all the characteristics found on the material (output) page and and sets their respective values

  static int proben_anz;
  static int empfaenger_anz;

  static int calculateScore() {
    /// used to calculate the complexity score of material (output)
    int score = proben_anz + empfaenger_anz;
    return score;
  }

  static ScoreData generateUserDataObjects(
      String pageTitle, int score, barColor) {
    /// used to generate a score data object
    return new ScoreData(pageTitle, score, barColor);
  }

  static void setProbenAnzAnzValue(String value) {
    if (value == "1") proben_anz = 1;

    if (value == "2") proben_anz = 2;

    if (value == "3 oder mehr") proben_anz = 3;

    if (value == "keine Angaben") proben_anz = 0;

    if (value == "nicht relevant") proben_anz = 0;
  }

  static void setEmpfaengerAnzValue(String value) {
    if (value == "1") empfaenger_anz = 1;

    if (value == "2") empfaenger_anz = 2;

    if (value == "3 oder mehr") empfaenger_anz = 3;

    if (value == "keine Angaben") empfaenger_anz = 0;

    if (value == "nicht relevant") empfaenger_anz = 0;
  }
}
