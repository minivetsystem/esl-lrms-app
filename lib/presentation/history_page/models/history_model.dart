class NotificationResponse {
  final bool status;
  final NotificationResults results;
  final String message;

  NotificationResponse({
    required this.status,
    required this.results,
    required this.message,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      status: json['status'],
      results: NotificationResults.fromJson(json['results']),
      message: json['message'],
    );
  }
}

class NotificationResults {
  final List<NotificationItem> userNotifications;
  // Add other properties as needed

  NotificationResults({
    required this.userNotifications,
    // Add other properties as needed
  });

  factory NotificationResults.fromJson(Map<String, dynamic> json) {
    return NotificationResults(
      userNotifications: (json['userNotifications'] as List<dynamic>)
          .map((item) => NotificationItem.fromJson(item))
          .toList(),
      // Add other properties as needed
    );
  }
}

class NotificationItem {
  final int id;
  final int userId;
  final int notificationId;
  final String isSeen;
  final String isResponse;
  final String? message;
  final String createdAt;
  final String updatedAt;
  final String notificationStatus;
  final NotificationDetails notification;

  NotificationItem({
    required this.id,
    required this.userId,
    required this.notificationId,
    required this.isSeen,
    required this.isResponse,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
    required this.notificationStatus,
    required this.notification,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['id'],
      userId: json['user_id'],
      notificationId: json['notification_id'],
      isSeen: json['is_seen'],
      isResponse: json['is_response'],
      message: json['message'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      notificationStatus: json['notification_status'],
      notification: NotificationDetails.fromJson(json['notification']),
    );
  }
}

class NotificationDetails {
  final int id;
  final int notificationTypeId;
  final int userId;
  final String createdAt;
  final String details;
  final String title;
  final NotificationType notificationType;
  final List<NotificationDetailItem> detail;
  final User user;
  final List<Visit> visits;

  NotificationDetails({
    required this.id,
    required this.notificationTypeId,
    required this.userId,
    required this.createdAt,
    required this.details,
    required this.title,
    required this.notificationType,
    required this.detail,
    required this.user,
    required this.visits,
  });

  factory NotificationDetails.fromJson(Map<String, dynamic> json) {
    return NotificationDetails(
      id: json['id'],
      notificationTypeId: json['notification_type_id'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      details: json['details'],
      title: json['title'],
      notificationType: NotificationType.fromJson(json['notification_type']),
      detail: (json['detail'] as List<dynamic>)
          .map((item) => NotificationDetailItem.fromJson(item))
          .toList(),
      user: User.fromJson(json['user']),
      visits: (json['visits'] as List<dynamic>)
          .map((item) => Visit.fromJson(item))
          .toList(),
    );
  }
}

class NotificationType {
  final int id;
  final String name;

  NotificationType({
    required this.id,
    required this.name,
  });

  factory NotificationType.fromJson(Map<String, dynamic> json) {
    return NotificationType(
      id: json['id'],
      name: json['name'],
    );
  }
}

class NotificationDetailItem {
  final int id;
  final int notificationId;
  final String details;
  final dynamic area;
  final int isMultiPlot;
  final int village;
  final VillageDetails villageDetails;

  NotificationDetailItem({
    required this.id,
    required this.notificationId,
    required this.details,
    required this.area,
    required this.isMultiPlot,
    required this.village,
    required this.villageDetails,
  });

  factory NotificationDetailItem.fromJson(Map<String, dynamic> json) {
    return NotificationDetailItem(
      id: json['id'],
      notificationId: json['notification_id'],
      details: json['details'],
      area: json['area'],
      isMultiPlot: json['is_multi_plot'],
      village: json['village'],
      villageDetails: VillageDetails.fromJson(json['village_details']),
    );
  }
}

class VillageDetails {
  final int id;
  final String name;

  VillageDetails({
    required this.id,
    required this.name,
  });

  factory VillageDetails.fromJson(Map<String, dynamic> json) {
    return VillageDetails(
      id: json['id'],
      name: json['name'],
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String username;
  final String profileImageUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.profileImageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      profileImageUrl: json['profile_image_url'],
    );
  }
}

class Visit {
  final int id;
  final int notificationId;
  final int isCompleted;

  Visit({
    required this.id,
    required this.notificationId,
    required this.isCompleted,
  });

  factory Visit.fromJson(Map<String, dynamic> json) {
    return Visit(
      id: json['id'],
      notificationId: json['notification_id'],
      isCompleted: json['is_completed'],
    );
  }
}