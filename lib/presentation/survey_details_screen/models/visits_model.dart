class VisitsData {
  int? id;
  int? notificationId;
  int? userId;
  double? lat;
  double? lng;
  String? village;
  String? plot;
  String? comments;
  String? address;
  String? houseType;
  String? owerName;
  String? currentStatus;
  String? noOfHouse;
  String? estimatedArea;
  String? personsLiving;
  String? disturbence;
  String? encroucherName;
  String? encroucherContact;
  int? isCompleted;
  String? createdAt;
  String? updatedAt;
  List<Images>? images;

  VisitsData(
      {this.id,
      this.notificationId,
      this.userId,
      this.lat,
      this.lng,
      this.village,
      this.plot,
      this.comments,
      this.address,
      this.houseType,
      this.owerName,
      this.currentStatus,
      this.noOfHouse,
      this.estimatedArea,
      this.personsLiving,
      this.disturbence,
      this.encroucherName,
      this.encroucherContact,
      this.isCompleted,
      this.createdAt,
      this.updatedAt,
      this.images
     });

  VisitsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationId = json['notification_id'];
    userId = json['user_id'];
    lat = json['lat'];
    lng = json['lng'];
    village = json['village'];
    plot = json['plot'];
    comments = json['comments'];
    address = json['address'];
    houseType = json['house_type'];
    owerName = json['ower_name'];
    currentStatus = json['current_status'];
    noOfHouse = json['no_of_house'];
    estimatedArea = json['estimated_area'];
    personsLiving = json['persons_living'];
    disturbence = json['disturbence'];
    encroucherName = json['encroucher_name'];
    encroucherContact = json['encroucher_contact'];
    isCompleted = json['is_completed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notification_id'] = this.notificationId;
    data['user_id'] = this.userId;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['village'] = this.village;
    data['plot'] = this.plot;
    data['comments'] = this.comments;
    data['address'] = this.address;
    data['house_type'] = this.houseType;
    data['ower_name'] = this.owerName;
    data['current_status'] = this.currentStatus;
    data['no_of_house'] = this.noOfHouse;
    data['estimated_area'] = this.estimatedArea;
    data['persons_living'] = this.personsLiving;
    data['disturbence'] = this.disturbence;
    data['encroucher_name'] = this.encroucherName;
    data['encroucher_contact'] = this.encroucherContact;
    data['is_completed'] = this.isCompleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Images {
  int? id;
  int? visitId;
  String? url;
  String? name;
  String? actualName;
  String? lat;
  String? lng;
  String? uploadType;
  int? doumentTypeId;
  String? createdAt;
  String? updatedAt;

  Images(
      {this.id,
      this.visitId,
      this.url,
      this.name,
      this.actualName,
      this.lat,
      this.lng,
      this.uploadType,
      this.doumentTypeId,
      this.createdAt,
      this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    visitId = json['visit_id'];
    url = json['url'];
    name = json['name'];
    actualName = json['actual_name'];
    lat = json['lat'];
    lng = json['lng'];
    uploadType = json['upload_type'];
    doumentTypeId = json['doument_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['visit_id'] = this.visitId;
    data['url'] = this.url;
    data['name'] = this.name;
    data['actual_name'] = this.actualName;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['upload_type'] = this.uploadType;
    data['doument_type_id'] = this.doumentTypeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}