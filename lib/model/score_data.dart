import "package:charts_flutter/flutter.dart" as charts;

class ScoreData {
  ///This class is created to declare the parameters needed to appropriately create a score data.
  String pageTitle;
  int score;
  charts.Color barColor;

  ScoreData(this.pageTitle, this.score, this.barColor);

  @override
  String toString() {
    ///converts the values of score data to strings
    return 'Title: $pageTitle, Score: $score}';
  }
}
