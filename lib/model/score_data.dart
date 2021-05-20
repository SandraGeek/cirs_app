

class ScoreData {
  String _pageTitle;
  int _score;

  ScoreData(this._pageTitle, this._score);

  @override
  String toString() {
    return 'Title: $_pageTitle, Score: $_score}';
  }
}
