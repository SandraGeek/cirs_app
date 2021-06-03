import 'package:cirs_app/model/score_data.dart';

class ProbenInputData {
  /// This class declares all the characteristics found on the material (input) page and and sets their respective values

  static int proben_anz;
  static int absender_anz;

  static int calculateScore() {
    /// used to calculate the complexity score of material (input)
    int score = proben_anz + absender_anz;
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

  static void setAbsenderAnzValue(String value) {
    if (value == "1") absender_anz = 1;

    if (value == "2") absender_anz = 2;

    if (value == "3 oder mehr") absender_anz = 3;

    if (value == "keine Angaben") absender_anz = 0;

    if (value == "nicht relevant") absender_anz = 0;
  }
}
