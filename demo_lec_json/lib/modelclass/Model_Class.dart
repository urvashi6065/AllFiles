class ModelClass {
  final int? id;
  final String? name;
  final String? username;
  final String? email;

  ModelClass(
      {required this.id,
      required this.name,
      required this.username,
      required this.email});

  factory ModelClass.fromJson(Map map) {
    return ModelClass(
        id: map['id'],
        name: map['name'],
        username: map['username'],
        email: map['email']);
  }
}

class Address {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;
  final String? phone;
  final String? website;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo,required this.phone,required this.website});

  factory Address.fromJson(Map map) {
    return Address(
        street: map['street'],
        suite: map['suite'],
        city: map['city'],
        zipcode: map['zipcode'],
        geo: Geo.fromJson(map['geo']), phone: map['phone'], website: map['website']);
  }
}

class Geo {
  final String? lat;
  final String? lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map map) {
    return Geo(lat: map['lat'], lng: map['lng']);
  }
}
class Company{
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({required this.name,required  this.catchPhrase,required  this.bs});
  
  factory Company.fromJson(Map map){
    return Company(name: map['name'], catchPhrase: map['catchPhrase'], bs: map['bs']);
  }
}
