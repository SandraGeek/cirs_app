import 'package:cirs_app/model/score_data.dart';

class InfoInputData {
  /// This class declares all the characteristics found on the information (input) page and and sets their respective values

  static int infoQuelle_anz;
  static int absender_anz;
  static int form_des_infoaustausches;
  static int infotyp_und_struktur;
  static int infoVolumen;

  static int calculateScore() {
    /// used to calculate the complexity score of information (input)

    int score = infoQuelle_anz +
        absender_anz +
        form_des_infoaustausches +
        infotyp_und_struktur +
        infoVolumen;
    return score;
  }

  static ScoreData generateUserDataObjects(
      String pageTitle, int score, barColor) {
    /// used to generate a score data object

    return new ScoreData(pageTitle, score, barColor);
  }

  static void setInfoQuelleAnzValue(String value) {
    if (value == "1") infoQuelle_anz = 1;

    if (value == "2") infoQuelle_anz = 2;

    if (value == "3 oder mehr") infoQuelle_anz = 3;

    if (value == "keine Angaben") infoQuelle_anz = 0;

    if (value == "nicht relevant") infoQuelle_anz = 0;
  }

  static void setAbsenderAnzValue(String value) {
    if (value == "1") absender_anz = 1;

    if (value == "2") absender_anz = 2;

    if (value == "3 oder mehr") absender_anz = 3;

    if (value == "keine Angaben") absender_anz = 0;

    if (value == "nicht relevant") absender_anz = 0;
  }

  static void setInfoAustauschFormValue(String value) {
    if (value == "einzeln") form_des_infoaustausches = 1;

    if (value == "sequentiell") form_des_infoaustausches = 2;

    if (value == "quasi gleichzeitg") form_des_infoaustausches = 3;

    if (value == "keine Angaben") form_des_infoaustausches = 0;

    if (value == "nicht relevant") form_des_infoaustausches = 0;
  }

  static void setInfoTypUndStrukturValue(String value) {
    if (value == "strukturiert digital") infotyp_und_struktur = 1;

    if (value == "unstrukturiert digital") infotyp_und_struktur = 2;

    if (value == "strukturiert gedruckt") infotyp_und_struktur = 3;

    if (value == "unstrukturiert gedruckt") infotyp_und_struktur = 4;

    if (value == "strukturiert handschriftlich") infotyp_und_struktur = 5;

    if (value == "unstrukturiert handschriftlich") infotyp_und_struktur = 6;

    if (value == "strukturiert gesprochen") infotyp_und_struktur = 7;

    if (value == "unstrukturiert gesprochen") infotyp_und_struktur = 8;

    if (value == "keine Angaben") infotyp_und_struktur = 0;

    if (value == "nicht relevant") infotyp_und_struktur = 0;
  }

  static void setInfoVolumenValue(String value) {
    if (value == "gering") infoVolumen = 1;

    if (value == "gross") infoVolumen = 2;

    if (value == "keine Angaben") infoVolumen = 0;

    if (value == "nicht relevant") infoVolumen = 0;
  }
}
