class PlotDetailsfromSearch {
  bool? status;
  List<MapFeatures>? mapFeatures;
  String? message;

  PlotDetailsfromSearch({this.status, this.mapFeatures, this.message});

  PlotDetailsfromSearch.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['mapFeatures'] != null) {
      mapFeatures = <MapFeatures>[];
      json['mapFeatures'].forEach((v) {
        mapFeatures!.add(new MapFeatures.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.mapFeatures != null) {
      data['mapFeatures'] = this.mapFeatures!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class MapFeatures {
  int? id;
  String? geoType;
  String? geoCoordinates;
  String? propertiesId;
  String? lat;
  String? lng;
  String? status;
  int? mapLayerId;
  String? updatedAt;
  String? createdAt;
  MapLayers? mapLayers;

  MapFeatures(
      {this.id,
      this.geoType,
      this.geoCoordinates,
      this.propertiesId,
      this.lat,
      this.lng,
      this.status,
      this.mapLayerId,
      this.updatedAt,
      this.createdAt,
      this.mapLayers});

  MapFeatures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    geoType = json['geo_type'];
    geoCoordinates = json['geo_coordinates'];
    propertiesId = json['properties_id'];
    lat = json['lat'];
    lng = json['lng'];
    status = json['status'];
    mapLayerId = json['map_layer_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    mapLayers = json['map_layers'] != null
        ? new MapLayers.fromJson(json['map_layers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['geo_type'] = this.geoType;
    data['geo_coordinates'] = this.geoCoordinates;
    data['properties_id'] = this.propertiesId;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['status'] = this.status;
    data['map_layer_id'] = this.mapLayerId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    if (this.mapLayers != null) {
      data['map_layers'] = this.mapLayers!.toJson();
    }
    return data;
  }
}

class MapLayers {
  int? id;
  String? uploadedPath;
  String? name;
  Null? notes;
  String? originalName;
  String? type;
  double? lat;
  double? lng;
  String? status;
  int? userId;
  int? villageId;
  String? createdAt;
  String? updatedAt;
  Village? village;

  MapLayers(
      {this.id,
      this.uploadedPath,
      this.name,
      this.notes,
      this.originalName,
      this.type,
      this.lat,
      this.lng,
      this.status,
      this.userId,
      this.villageId,
      this.createdAt,
      this.updatedAt,
      this.village});

  MapLayers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uploadedPath = json['uploaded_path'];
    name = json['name'];
    notes = json['notes'];
    originalName = json['original_name'];
    type = json['type'];
    lat = json['lat'];
    lng = json['lng'];
    status = json['status'];
    userId = json['user_id'];
    villageId = json['village_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    village =
        json['village'] != null ? new Village.fromJson(json['village']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uploaded_path'] = this.uploadedPath;
    data['name'] = this.name;
    data['notes'] = this.notes;
    data['original_name'] = this.originalName;
    data['type'] = this.type;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['village_id'] = this.villageId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.village != null) {
      data['village'] = this.village!.toJson();
    }
    return data;
  }
}

class Village {
  int? id;
  String? name;
  String? status;
  int? riId;
  int? createdBy;
  String? createdAt;
  String? updatedAt;

  Village(
      {this.id,
      this.name,
      this.status,
      this.riId,
      this.createdBy,
      this.createdAt,
      this.updatedAt});

  Village.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    riId = json['ri_id'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['ri_id'] = this.riId;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}