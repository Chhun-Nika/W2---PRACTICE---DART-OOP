class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address({required String street, required String city, required String zipCode}) : 
    _street = street,
    _city = city,
    _zipCode = zipCode;


  String get street => this._street;
  String get city => this._city;
  String get zipCode => this._zipCode;
}
