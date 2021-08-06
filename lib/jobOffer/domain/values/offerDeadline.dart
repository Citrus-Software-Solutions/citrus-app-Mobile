class OfferDeadline {
  final DateTime? _deadline;

  OfferDeadline(this._deadline);

  DateTime? get getBeginDate => this._deadline;

  @override
  String toString() {
    return this._deadline!.toString();
  }
}
