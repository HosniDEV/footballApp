class TeamInformation {
  Team? team;
  Venue? venue;
  TeamInformation({
    this.team,
    this.venue,
  });
  factory TeamInformation.fromJson(Map<String, dynamic> json) {
    return TeamInformation(
      team: json['team'] != null ? Team.fromJson(json['team']) : null,
      venue: json['venue'] != null ? Venue.fromJson(json['venue']) : null,
    );
  }
}

class Team {
  int? id;
  String? name;
  String? country;
  int? founded;
  String? logo;
  Team({
    this.name,
    this.country,
    this.id,
    this.founded,
    this.logo,
  });
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      name: json['name'] ?? '',
      id: json['id'],
      country: json['country'],
      founded: json['founded'],
      logo: json['logo'] ?? '',
    );
  }
}

class Venue {
  int? id;
  String? name;
  String? address;
  String? city;
  String? image;
  int? capacity;
  Venue({
    this.id,
    this.name,
    this.address,
    this.city,
    this.capacity,
    this.image,
  });
  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      name: json['name'],
      id: json['id'],
      address: json['address'],
      city: json['city'],
      capacity: json['capacity'],
      image: json['image'],
    );
  }
}
