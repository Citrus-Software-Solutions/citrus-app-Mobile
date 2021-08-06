class StartDate {
  final DateTime _start;

  StartDate(this._start);

  DateTime get date => _start;

  String get dateAsString => _start.toLocal().toString().split(" ")[0];

  String get timeAsString => _start.toLocal().toString().split(" ")[1];
}
