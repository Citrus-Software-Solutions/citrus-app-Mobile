class Schedule {
  final DateTime? _beginDate;
  final DateTime? _endDate;

  Schedule(this._beginDate, this._endDate);

  DateTime? get getBeginDate => this._beginDate;

  DateTime? get getEndDate => this._endDate;

  @override
  String toString() {
    return this._beginDate!.toString() + " - " + this._endDate!.toString();
  }
}
