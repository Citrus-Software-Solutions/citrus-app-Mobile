class OfferId {
  final int? _offerId;

  OfferId(this._offerId);

  int? get getId => this._offerId;

  @override
  String toString() {
    return this._offerId!.toString();
  }
}
