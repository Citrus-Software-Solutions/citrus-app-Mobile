class Address {
  final String? _street1;
  final String? _street2;
  final String? _city;
  final String? _state;
  final String? _zip;

  Address(this._street1, this._street2, this._city, this._state, this._zip);

  @override
  String toString() {
    return this._street1! +
        ", " +
        this._city! +
        ", " +
        this._state! +
        " " +
        this._zip!.toString();
  }

  String get city => this._city!.toString();
}
