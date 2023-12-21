// class NotificationResponse {
//   final bool status;
//   final NotificationResults results;
//   final String message;

//   NotificationResponse({
//     required this.status,
//     required this.results,
//     required this.message,
//   });

//   factory NotificationResponse.fromJson(Map<String, dynamic> json) {
//     return NotificationResponse(
//       status: json['status'],
//       results: NotificationResults.fromJson(json['results']),
//       message: json['message'],
//     );
//   }
// }

// class NotificationResults {
//   final List<NotificationItem> userNotifications;
//   // Add other properties as needed

//   NotificationResults({
//     required this.userNotifications,
//     // Add other properties as needed
//   });

//   factory NotificationResults.fromJson(Map<String, dynamic> json) {
//     return NotificationResults(
//       userNotifications: (json['userNotifications'] as List<dynamic>)
//           .map((item) => NotificationItem.fromJson(item))
//           .toList(),
//       // Add other properties as needed
//     );
//   }
// }

// class NotificationItem {
//   final int id;
//   final int userId;
//   final int notificationId;
//   final String isSeen;
//   final String isResponse;
//   final String? message;
//   final String createdAt;
//   final String updatedAt;
//   final String notificationStatus;
//   final NotificationDetails notification;

//   NotificationItem({
//     required this.id,
//     required this.userId,
//     required this.notificationId,
//     required this.isSeen,
//     required this.isResponse,
//     required this.message,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.notificationStatus,
//     required this.notification,
//   });

//   factory NotificationItem.fromJson(Map<String, dynamic> json) {
//     return NotificationItem(
//       id: json['id'],
//       userId: json['user_id'],
//       notificationId: json['notification_id'],
//       isSeen: json['is_seen'],
//       isResponse: json['is_response'],
//       message: json['message'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       notificationStatus: json['notification_status'],
//       notification: NotificationDetails.fromJson(json['notification']),
//     );
//   }
// }

// class NotificationDetails {
//   final int id;
//   final int notificationTypeId;
//   final int userId;
//   final String createdAt;
//   final String details;
//   final String title;
//   final NotificationType notificationType;
//   final List<NotificationDetailItem> detail;
//   final User user;
//   final List<Visit> visits;

//   NotificationDetails({
//     required this.id,
//     required this.notificationTypeId,
//     required this.userId,
//     required this.createdAt,
//     required this.details,
//     required this.title,
//     required this.notificationType,
//     required this.detail,
//     required this.user,
//     required this.visits,
//   });

//   factory NotificationDetails.fromJson(Map<String, dynamic> json) {
//     return NotificationDetails(
//       id: json['id'],
//       notificationTypeId: json['notification_type_id'],
//       userId: json['user_id'],
//       createdAt: json['created_at'],
//       details: json['details'],
//       title: json['title'],
//       notificationType: NotificationType.fromJson(json['notification_type']),
//       detail: (json['detail'] as List<dynamic>)
//           .map((item) => NotificationDetailItem.fromJson(item))
//           .toList(),
//       user: User.fromJson(json['user']),
//       visits: (json['visits'] as List<dynamic>)
//           .map((item) => Visit.fromJson(item))
//           .toList(),
//     );
//   }
// }

// class NotificationType {
//   final int id;
//   final String name;

//   NotificationType({
//     required this.id,
//     required this.name,
//   });

//   factory NotificationType.fromJson(Map<String, dynamic> json) {
//     return NotificationType(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }

// class NotificationDetailItem {
//   final int id;
//   final int notificationId;
//   final String details;
//   final dynamic area;
//   final int isMultiPlot;
//   final int village;
//   final VillageDetails villageDetails;

//   NotificationDetailItem({
//     required this.id,
//     required this.notificationId,
//     required this.details,
//     required this.area,
//     required this.isMultiPlot,
//     required this.village,
//     required this.villageDetails,
//   });

//   factory NotificationDetailItem.fromJson(Map<String, dynamic> json) {
//     return NotificationDetailItem(
//       id: json['id'],
//       notificationId: json['notification_id'],
//       details: json['details'],
//       area: json['area'],
//       isMultiPlot: json['is_multi_plot'],
//       village: json['village'],
//       villageDetails: VillageDetails.fromJson(json['village_details']),
//     );
//   }
// }

// class VillageDetails {
//   final int id;
//   final String name;

//   VillageDetails({
//     required this.id,
//     required this.name,
//   });

//   factory VillageDetails.fromJson(Map<String, dynamic> json) {
//     return VillageDetails(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }

// class User {
//   final int id;
//   final String name;
//   final String email;
//   final String username;
//   final String profileImageUrl;

//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.username,
//     required this.profileImageUrl,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       username: json['username'],
//       profileImageUrl: json['profile_image_url'],
//     );
//   }
// }

// class Visit {
//   final int id;
//   final int notificationId;
//   final int isCompleted;

//   Visit({
//     required this.id,
//     required this.notificationId,
//     required this.isCompleted,
//   });

//   factory Visit.fromJson(Map<String, dynamic> json) {
//     return Visit(
//       id: json['id'],
//       notificationId: json['notification_id'],
//       isCompleted: json['is_completed'],
//     );
//   }
// }
class NotificationResponse {
  bool? status;
  Results? results;
  String? message;

  NotificationResponse({this.status, this.results, this.message});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
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
  // List<Null>? notifications;
  int? totalPage;
  List<Null>? keysData;
  List<UserNotifications>? userNotifications;
  int? inVisitsUnique;
  int? totalRunning;
  int? totalCount;
  int? closedSurvey;
  int? openSurvey;

  Results(
      {
      this.totalPage,
      this.keysData,
      this.userNotifications,
      this.inVisitsUnique,
      this.totalRunning,
      this.totalCount,
      this.closedSurvey,
      this.openSurvey});

  Results.fromJson(Map<String, dynamic> json) {
    // if (json['notifications'] != null) {
    //   notifications = <Null>[];
    //   json['notifications'].forEach((v) {
    //     notifications!.add(new Null.fromJson(v));
    //   });
    // }
    totalPage = json['totalPage'];
    // if (json['keysData'] != null) {
    //   keysData = <Null>[];
    //   json['keysData'].forEach((v) {
    //     keysData!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['userNotifications'] != null) {
      userNotifications = <UserNotifications>[];
      json['userNotifications'].forEach((v) {
        userNotifications!.add(new UserNotifications.fromJson(v));
      });
    }
    inVisitsUnique = json['inVisitsUnique'];
    totalRunning = json['totalRunning'];
    totalCount = json['totalCount'];
    closedSurvey = json['closedSurvey'];
    openSurvey = json['openSurvey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.notifications != null) {
    //   data['notifications'] =
    //       this.notifications!.map((v) => v.toJson()).toList();
    // }
    data['totalPage'] = this.totalPage;
    // if (this.keysData != null) {
    //   data['keysData'] = this.keysData!.map((v) => v.toJson()).toList();
    // }
    if (this.userNotifications != null) {
      data['userNotifications'] =
          this.userNotifications!.map((v) => v.toJson()).toList();
    }
    data['inVisitsUnique'] = this.inVisitsUnique;
    data['totalRunning'] = this.totalRunning;
    data['totalCount'] = this.totalCount;
    data['closedSurvey'] = this.closedSurvey;
    data['openSurvey'] = this.openSurvey;
    return data;
  }
}

class UserNotifications {
  int? id;
  int? userId;
  int? notificationId;
  String? isSeen;
  String? isResponse;
  Null? message;
  String? createdAt;
  String? updatedAt;
  String? notificationStatus;
  Notification? notification;

  UserNotifications(
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

  UserNotifications.fromJson(Map<String, dynamic> json) {
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
  Null? area;
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