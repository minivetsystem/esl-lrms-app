class SurveyItemList {
  int? id;
  int? userId;
  int? notificationId;
  String? isSeen;
  String? isResponse;
  Null message;
  String? createdAt;
  String? updatedAt;
  String? notificationStatus;
  Notification? notification;

  SurveyItemList(
      {this.id,
      this.userId,
      this.notificationId,
      this.isSeen,
      this.isResponse,
      this.message,
      this.createdAt,
      this.updatedAt,
      this.notificationStatus,
      this.notification});

  SurveyItemList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    notificationId = json['notification_id'];
    isSeen = json['is_seen'];
    isResponse = json['is_response'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    notificationStatus = json['notification_status'];
    notification = json['notification'] != null
        ? new Notification.fromJson(json['notification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['notification_id'] = this.notificationId;
    data['is_seen'] = this.isSeen;
    data['is_response'] = this.isResponse;
    data['message'] = this.message;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['notification_status'] = this.notificationStatus;
    if (this.notification != null) {
      data['notification'] = this.notification!.toJson();
    }
    return data;
  }
}

class Notification {
  int? id;
  int? notificationTypeId;
  int? userId;
  String? createdAt;
  String? details;
  String? title;
  NotificationType? notificationType;
  List<Detail>? detail;
  User? user;
  List<Visits>? visits;

  Notification(
      {this.id,
      this.notificationTypeId,
      this.userId,
      this.createdAt,
      this.details,
      this.title,
      this.notificationType,
      this.detail,
      this.user,
      this.visits});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationTypeId = json['notification_type_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    details = json['details'];
    title = json['title'];
    notificationType = json['notification_type'] != null
        ? new NotificationType.fromJson(json['notification_type'])
        : null;
    if (json['detail'] != null) {
      detail = <Detail>[];
      json['detail'].forEach((v) {
        detail!.add(new Detail.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['visits'] != null) {
      visits = <Visits>[];
      json['visits'].forEach((v) {
        visits!.add(new Visits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notification_type_id'] = this.notificationTypeId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['details'] = this.details;
    data['title'] = this.title;
    if (this.notificationType != null) {
      data['notification_type'] = this.notificationType!.toJson();
    }
    if (this.detail != null) {
      data['detail'] = this.detail!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.visits != null) {
      data['visits'] = this.visits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationType {
  int? id;
  String? name;

  NotificationType({this.id, this.name});

  NotificationType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Detail {
  int? id;
  int? notificationId;
  String? details;
  Null area;
  int? isMultiPlot;
  int? village;
  NotificationType? villageDetails;

  Detail(
      {this.id,
      this.notificationId,
      this.details,
      this.area,
      this.isMultiPlot,
      this.village,
      this.villageDetails});

  Detail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationId = json['notification_id'];
    details = json['details'];
    area = json['area'];
    isMultiPlot = json['is_multi_plot'];
    village = json['village'];
    villageDetails = json['village_details'] != null
        ? new NotificationType.fromJson(json['village_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notification_id'] = this.notificationId;
    data['details'] = this.details;
    data['area'] = this.area;
    data['is_multi_plot'] = this.isMultiPlot;
    data['village'] = this.village;
    if (this.villageDetails != null) {
      data['village_details'] = this.villageDetails!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? username;
  String? profileImageUrl;

  User({this.id, this.name, this.email, this.username, this.profileImageUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    profileImageUrl = json['profile_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['profile_image_url'] = this.profileImageUrl;
    return data;
  }
}

class Visits {
  int? id;
  int? notificationId;
  int? isCompleted;

  Visits({this.id, this.notificationId, this.isCompleted});

  Visits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationId = json['notification_id'];
    isCompleted = json['is_completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notification_id'] = this.notificationId;
    data['is_completed'] = this.isCompleted;
    return data;
  }
}