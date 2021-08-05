class OfferDuration {
  final int? _duration;

  OfferDuration(this._duration);

  @override
  String toString() {
    return this._duration!.toString();
  }

  int? get getSalary => this._duration;
}
