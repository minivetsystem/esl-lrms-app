import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsServices {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings = AndroidInitializationSettings('ic_launcher');

  void initialiseNotifications() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: _androidInitializationSettings
    );

    await notificationsPlugin.initialize(initializationSettings);
  }
  void sendNotification(String title,String body) async {
    AndroidNotificationDetails androidNotificationDetails = 
    AndroidNotificationDetails('channelId', 'channelName',importance: Importance.max,
    priority: Priority.high);

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails
    );
    
    notificationsPlugin.show(0, title, body, notificationDetails);
  }
}