class ModalClass {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  ModalClass(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});

  factory ModalClass.fromjson(Map map) {
    return ModalClass(
        id: map['id'],
        name: map['name'],
        username: map['username'],
        email: map['email'],
        address: Address.fromjson(map['address']),
        phone: map['phone'],
        website: map['website'],
        company: Company.fromjson(map['company']));
  }
}

class Address {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});

  factory Address.fromjson(Map map) {
    return Address(
      street: map['street'],
      suite: map['suite'],
      city: map['city'],
      zipcode: map['zipcode'],
      geo: Geo.fromjson(map['geo']),
    );
  }
}

class Geo {
  final String? lat;
  final String? lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromjson(Map map) {
    return Geo(lat: map['lat'], lng: map['lng']);
  }
}

class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromjson(Map map) {
    return Company(
        name: map['name'], catchPhrase: map['catchPhrase'], bs: map['bs']);
  }
}
