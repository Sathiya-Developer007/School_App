class Period {
  final int periodid;
  final String timein;
  final String timeout;
  final String periodname;

  Period({
    required this.periodid,
    required this.timein,
    required this.timeout,
    required this.periodname,
  });

  factory Period.fromJson(Map<String, dynamic> json) {
    return Period(
      periodid: json['periodid'],
      timein: json['timein'],
      timeout: json['timeout'],
      periodname: json['periodname'],
    );
  }

  String get timeRange => "$timein - $timeout";
  String get name => periodname;
}
