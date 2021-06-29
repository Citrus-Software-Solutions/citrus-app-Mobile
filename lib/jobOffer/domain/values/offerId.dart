class OfferId {
  final int? offerId;

  OfferId(this.offerId);

  int? getId() {
    return this.offerId;
  }
  String getOfferIdToString() {
    return this.offerId.toString();
  }
}
