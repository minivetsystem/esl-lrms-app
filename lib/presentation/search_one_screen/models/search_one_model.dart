class LayerList {
  bool? status;
  List<Results>? results;
  List<MapLayerVillages>? mapLayerVillages;
  String? message;

  LayerList({this.status, this.results, this.mapLayerVillages, this.message});

  LayerList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    if (json['mapLayerVillages'] != null) {
      mapLayerVillages = <MapLayerVillages>[];
      json['mapLayerVillages'].forEach((v) {
        mapLayerVillages!.add(new MapLayerVillages.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    if (this.mapLayerVillages != null) {
      data['mapLayerVillages'] =
          this.mapLayerVillages!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Results {
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
  User? user;
  Village? village;

  Results(
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
      this.user,
      this.village});

  Results.fromJson(Map<String, dynamic> json) {
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.village != null) {
      data['village'] = this.village!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? username;
  Null? departmentId;
  Null? phoneno;
  Null? whatasppno;
  Null? profileImageOriginalName;
  String? profileImageName;
  String? profileImageUrl;
  Null? signatureImageUrl;
  Null? stampImageUrl;
  Null? resetToken;
  String? verify;
  Null? verifyToken;
  Null? passwordResets;
  String? createdAt;
  Null? createdBy;
  String? updatedAt;
  Null? deletedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.departmentId,
      this.phoneno,
      this.whatasppno,
      this.profileImageOriginalName,
      this.profileImageName,
      this.profileImageUrl,
      this.signatureImageUrl,
      this.stampImageUrl,
      this.resetToken,
      this.verify,
      this.verifyToken,
      this.passwordResets,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.deletedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    departmentId = json['department_id'];
    phoneno = json['phoneno'];
    whatasppno = json['whatasppno'];
    profileImageOriginalName = json['profile_image_original_name'];
    profileImageName = json['profile_image_name'];
    profileImageUrl = json['profile_image_url'];
    signatureImageUrl = json['signature_image_url'];
    stampImageUrl = json['stamp_image_url'];
    resetToken = json['reset_token'];
    verify = json['verify'];
    verifyToken = json['verify_token'];
    passwordResets = json['password_resets'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['department_id'] = this.departmentId;
    data['phoneno'] = this.phoneno;
    data['whatasppno'] = this.whatasppno;
    data['profile_image_original_name'] = this.profileImageOriginalName;
    data['profile_image_name'] = this.profileImageName;
    data['profile_image_url'] = this.profileImageUrl;
    data['signature_image_url'] = this.signatureImageUrl;
    data['stamp_image_url'] = this.stampImageUrl;
    data['reset_token'] = this.resetToken;
    data['verify'] = this.verify;
    data['verify_token'] = this.verifyToken;
    data['password_resets'] = this.passwordResets;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
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

class MapLayerVillages {
  String? name;
  int? id;
  List<Value>? value;

  MapLayerVillages({this.name, this.id, this.value});

  MapLayerVillages.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    if (json['value'] != null) {
      value = <Value>[];
      json['value'].forEach((v) {
        value!.add(new Value.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    if (this.value != null) {
      data['value'] = this.value!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Value {
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
  User? user;
  Village? village;

  Value(
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
      this.user,
      this.village});

  Value.fromJson(Map<String, dynamic> json) {
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.village != null) {
      data['village'] = this.village!.toJson();
    }
    return data;
  }
}
