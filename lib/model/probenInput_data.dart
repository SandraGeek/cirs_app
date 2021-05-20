import 'package:cirs_app/model/complexity_data.dart';
import 'package:cirs_app/model/score_data.dart';



class ProbenInputData {


  static int proben_anz;
  static int absender_anz;


  static int calculateScore() {

    int score = proben_anz + absender_anz;
    return score;
  }

  static ScoreData generateUserDataObjects(String pageTitle, int score) {

    return new ScoreData(pageTitle, score);

  }

  static ComplexityData generateUserComplexityObject(String pageTitle, String answer) {

    return new ComplexityData(pageTitle, answer);

  }

  static void setProbenAnzAnzValue(String value) {

    if (value == "1")
      proben_anz = 1;

    if (value == "2")
      proben_anz = 2;

    if (value == "3 oder mehr")
      proben_anz = 3;

    if (value == "keine Angaben")
      proben_anz = 0;

    if (value == "nicht relevant")
      proben_anz = 0;

  }

  static void setAbsenderAnzValue(String value) {

    if (value == "1")
      absender_anz = 1;

    if (value == "2")
      absender_anz = 2;

    if (value == "3 oder mehr")
      absender_anz = 3;

    if (value == "keine Angaben")
      absender_anz = 0;

    if (value == "nicht relevant")
      absender_anz = 0;

  }


}