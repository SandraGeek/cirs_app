import 'package:cirs_app/model/complexity_data.dart';
import 'package:cirs_app/model/score_data.dart';


class ResQualityData {

  static int arbeitsplatz;
  static int arbeitszeit;
  static int kontamination;
  static int laerm;
  static int loyalitaet;
  static int medikamente;
  static int medGeraete;
  static int medMaterial;
  static int raum;
  static int fehlerKorrektur;
  static int mitarbeiterZustand;
  static int kompetenz;
  static int sprachKompetenz;
  static int besetzung;
  static int sop;
  static int standardbedingungen;


  static int calculateScore() {

    int score = arbeitsplatz + arbeitszeit +kontamination + laerm + loyalitaet + medikamente + medGeraete + medMaterial + fehlerKorrektur + mitarbeiterZustand +
        kompetenz + sprachKompetenz + besetzung + sop + standardbedingungen + raum;
    return score;
  }

  static ScoreData generateUserDataObjects(String pageTitle, int score) {

    return new ScoreData(pageTitle, score);

  }

  static ComplexityData generateUserComplexityObject(String pageTitle, String answer) {

    return new ComplexityData(pageTitle, answer);

  }


  static void setArbeitsplatzValue(String value) {
    if (value == "strukturierter (aufgeräumter) Arbeitsplatz")
      arbeitsplatz = 1;

    if (value == "unstrukturierter (unaufgeräumter) Arbeitsplatz")
      arbeitsplatz = 2;

    if (value == "keine Angaben")
      arbeitsplatz = 0;

    if (value == "nicht relevant")
      arbeitsplatz = 0;

  }

  static void setArtbeitszeitValue(String value) {
    if (value == "keine Unterbrechung")
      arbeitszeit = 1;

    if (value == "Unterbrechung der Aufgabe")
      arbeitszeit = 2;

    if (value == "keine Angaben")
      arbeitszeit = 0;

    if (value == "nicht relevant")
      arbeitszeit = 0;

  }

  static void setkontaminationValue(String value) {
    if (value == "keine Kontamination")
      kontamination = 1;

    if (value == "potentielle Kontamination")
      kontamination = 2;

    if (value == "manifeste Kontamination")
      kontamination = 3;

    if (value == "keine Angaben")
      kontamination = 0;

    if (value == "nicht relevant")
      kontamination = 0;

  }
  static void setLaermValue(String value) {
    if (value == "kein Lärm")
      laerm = 1;

    if (value == "störender Lärm vorhanden")
      laerm = 2;

    if (value == "keine Angaben")
      laerm = 0;

    if (value == "nicht relevant")
      laerm = 0;

  }

  static void setLoyalitaetValue(String value) {
    if (value == "gering")
      loyalitaet = 2;

    if (value == "hoch")
      loyalitaet = 1;

    if (value == "keine Angaben")
      loyalitaet = 0;

    if (value == "nicht relevant")
      loyalitaet = 0;

  }

  static void setMedikamenteValue(String value) {
    if (value == "eindeutiger Name und eindeutiges Aussehen")
      medikamente = 1;

    if (value == "sound-alike Medikamente")
      medikamente = 2;

    if (value == "look-alike Medikamente")
      medikamente = 2;

    if (value == "fehlend")
      medikamente = 3;

    if (value == "keine Angaben")
      medikamente = 0;

    if (value == "nicht relevant")
      medikamente = 0;

  }

  static void setMedGeraeteValue(String value) {
    if (value == "angemessen und funktionierend")
      medGeraete = 1;

    if (value == "nicht angemessen, aber funktionierend")
      medGeraete = 1;

    if (value == "look-alike Geräteteile")
      medGeraete = 2;

    if (value == "fehlend, funktionslos")
      medGeraete = 3;

    if (value == "keine Angaben")
      medGeraete = 0;

    if (value == "nicht relevant")
      medGeraete = 0;

  }


  static void setMedMaterialValue(String value) {
    if (value == "angemessen, laut akzeptiertem Standard")
      medMaterial = 1;

    if (value == "nicht angemessen")
      medMaterial = 3;

    if (value == "look-alike Verbrauchsmaterialien")
      medMaterial = 2;

    if (value == "fehlend")
      medMaterial = 4;

    if (value == "keine Angaben")
      medMaterial = 0;

    if (value == "nicht relevant")
      medMaterial = 0;

  }

  static void setRaumValue(String value) {

    if (value == "angemessen")
      raum = 1;

    if (value == "nicht angemessen")
      raum = 2;

    if (value == "fehlender Raum")
      raum = 3;

    if (value == "keine Angaben")
      raum = 0;

    if (value == "nicht relevant")
      raum = 0;
  }

  static void setFehlerkorekturValue(String value) {

    if (value == "vorhanden")
      fehlerKorrektur = 1;

    if (value == "fehlend/keine Supervision")
      fehlerKorrektur = 2;

    if (value == "keine Angaben")
      fehlerKorrektur = 0;

    if (value == "nicht relevant")
      fehlerKorrektur = 0;
  }

  static void setMitarbeiterZustandValue(String value) {
    if (value == "fit, verfügbar")
      mitarbeiterZustand = 1;

    if (value == "ermüdet")
      mitarbeiterZustand = 2;

    if (value == "beschäftigt, nicht verfügbar")
      mitarbeiterZustand = 3;

    if (value == "keine Angaben")
      mitarbeiterZustand = 0;

    if (value == "nicht relevant")
      mitarbeiterZustand = 0;
  }

  static void setKompetenzValue(String value) {

    if (value == "kompetenzbewusst, kooperativ")
      kompetenz = 1;

    if (value == "kompetenzüberschreitend, kooperativ")
      kompetenz = 2;

    if (value == "kompetenzbewusst, nicht kooperativ")
      kompetenz = 3;

    if (value == "kompetenzüberschreitend, nicht kooperativ")
      kompetenz = 3;

    if (value == "keine Angaben")
      kompetenz = 0;

    if (value == "nicht relevant")
      kompetenz = 0;
  }

  static void setSprachKompetenzValue(String value) {

    if (value == "sprachkompetent")
      sprachKompetenz = 1;

    if (value == "eingeschränkte Sprachkompetenz")
      sprachKompetenz = 2;

    if (value == "nicht sprachkompetent")
      sprachKompetenz = 3;

    if (value == "keine Angaben")
      sprachKompetenz = 0;

    if (value == "nicht relevant")
      sprachKompetenz = 0;
  }

  static void setBesetzungValue(String value) {

    if (value == "angemessen qualifiziert und ausreichend")
      besetzung = 1;

    if (value == "angemessen qualifiziert und nicht ausreichend")
      besetzung = 2;

    if (value == "nicht angemessen qualifiziert, aber ausreichend")
      besetzung = 3;

    if (value == "nicht angemessen qualifiziert und nicht ausreichend")
      besetzung = 4;

    if (value == "keine Angaben")
      besetzung = 0;

    if (value == "nicht relevant")
      besetzung = 0;
  }


  static void setSopValue(String value) {

    if (value == "existent, verwendet")
      sop = 1;

    if (value == "existent, aber nicht verwendet")
      sop = 2;

    if (value == "nicht existent")
      sop = 3;

    if (value == "keine Angaben")
      sop = 0;

    if (value == "nicht relevant")
      sop = 0;
  }

  static void setStandardbedingungenValue(String value) {

    if (value == "konstant, nicht veränderte Standardbedingung")
      standardbedingungen = 1;

    if (value == "veränderte Standardbedingung")
      standardbedingungen = 2;

    if (value == "keine Standardbedingung")
      standardbedingungen = 3;

    if (value == "keine Angaben")
      standardbedingungen = 0;

    if (value == "nicht relevant")
      standardbedingungen = 0;
  }
}
