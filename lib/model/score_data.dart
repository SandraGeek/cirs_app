import "package:charts_flutter/flutter.dart" as charts;

class ScoreData {
   String pageTitle;
   int score;
   charts.Color barColor;

  ScoreData(this.pageTitle, this.score, this.barColor);

  @override
  String toString() {
    return 'Title: $pageTitle, Score: $score}';
  }
}
