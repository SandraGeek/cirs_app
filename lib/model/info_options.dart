class info_options {
  String option;
  int optionId;


  info_options({this.optionId, this.option});

  static List<info_options> getInfo_options() {
    return <info_options>[
      info_options(optionId: 1, option: "keine Information für die Aufgabe notwendig"),
      info_options(optionId: 2, option: "keine Angaben zu Information"),
      info_options(optionId: 3, option: "nicht relevant"),
    ];
  }
}