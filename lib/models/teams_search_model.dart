class TeamsSearch {
  String? get;
  Parameters? parameters;
  int? results;
  Paging? paging;
  List<Response>? response;

  TeamsSearch.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    parameters = json['parameters'] != null
        ? new Parameters.fromJson(json['parameters'])
        : null;
    results = json['results'];
    paging =
    json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(new Response.fromJson(v));
      });
    }
  }
}

class Parameters {
  String? search;


  Parameters.fromJson(Map<String, dynamic> json) {
    search = json['search'];
  }

}

class Paging {
  int? current;
  int? total;


  Paging.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    total = json['total'];
  }

}

class Response {
  Team? team;
  Venue? venue;


  Response.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
  }
}

class Team {
  int? id;
  String? name;
  String? code;
  String? country;
  int? founded;
  bool? national;
  String? logo;

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    country = json['country'];
    founded = json['founded'];
    national = json['national'];
    logo = json['logo'];
  }

}

class Venue {
  int? id;
  String? name;
  String? address;
  String? city;
  int? capacity;
  String? surface;
  String? image;


  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    capacity = json['capacity'];
    surface = json['surface'];
    image = json['image'];
  }

}
