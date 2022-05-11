class Coordinates {
  const Coordinates(this.latitude, this.longitude, this.city, this.state, this.country);

  final String latitude;
  final String longitude;
  final String city;
  final String state;
  final String country;

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      Coordinates(json['latitude'], json['longitude'], json['city'], json['state'], json['country']);
}