class LoadMapData {
  bool? status;
  Results? results;
  String? message;

  LoadMapData({this.status, this.results, this.message});

  LoadMapData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Results {
  Data? data;
  double? lat;
  double? lng;
  int? id;
  String? type;

  Results({this.data, this.lat, this.lng, this.id, this.type});

  Results.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    lat = json['lat'];
    lng = json['lng'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}

class Data {
  String? type;
  List<Features>? features;

  Data({this.type, this.features});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Features {
  String? type;
  Geometry? geometry;
  Properties? properties;

  Features({this.type, this.geometry, this.properties});

  Features.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Properties {
  int? base;
  String? status;
  String? id;
  String? type;
  int? plotId;
  int? villageId;
  String? villageName;

  Properties(
      {this.base,
      this.status,
      this.id,
      this.type,
      this.plotId,
      this.villageId,
      this.villageName});

  Properties.fromJson(Map<String, dynamic> json) {
    base = json['base'];
    status = json['status'];
    id = json['id'];
    type = json['type'];
    plotId = json['plot_id'];
    villageId = json['village_id'];
    villageName = json['village_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base'] = this.base;
    data['status'] = this.status;
    data['id'] = this.id;
    data['type'] = this.type;
    data['plot_id'] = this.plotId;
    data['village_id'] = this.villageId;
    data['village_name'] = this.villageName;
    return data;
  }
}