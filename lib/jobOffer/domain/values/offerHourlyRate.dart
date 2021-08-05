class OfferHourlyRate {
  final double? _hourlyRate;

  OfferHourlyRate(this._hourlyRate);

  double? get getHourlyRate => this._hourlyRate;

  @override
  String toString() {
    return this._hourlyRate!.toString();
  }
}
