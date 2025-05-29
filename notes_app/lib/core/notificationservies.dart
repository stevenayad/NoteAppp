import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tzData;
import 'package:timezone/timezone.dart' as tz;
import 'package:permission_handler/permission_handler.dart';

class NotificationServices {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void onTap(NotificationResponse notificationResponse) {
    log("Notification tapped with payload: ${notificationResponse.payload}");
  }

  static Future<void> init() async {
    const InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    ); 

    await initTimeZone();
    await requestPermissionss();
  }

  static Future<void> requestPermissionss() async {
    final status = await Permission.notification.request();

    if (status.isGranted) {
      log("✅ Notification permission granted");
    } else if (status.isDenied) {
      log("❌ Notification permission denied");
    } else if (status.isPermanentlyDenied) {
      log("❌ Notification permission permanently denied");
      // Optionally redirect user to app settings
      await openAppSettings();
    }
  }

  static Future<void> initTimeZone() async {
    try {
      tzData.initializeTimeZones();

      final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
      log("Device timezone: $currentTimeZone");

      // Try setting the actual timezone, fallback to default if it fails
      try {
        tz.setLocalLocation(tz.getLocation(currentTimeZone));
      } catch (e) {
        log("Timezone $currentTimeZone not found, using default: Africa/Cairo");
        tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
      }

      final now = tz.TZDateTime.now(tz.local);
      log("Timezone set to: ${tz.local.name}");
      log("Current datetime: $now");
    } catch (e) {
      log("Error initializing timezone: $e");
    }
  }

  static Future<void> showBasicNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'id1',
      'Basic Notification',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails details =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      "Basic Notification",
      "This is the notification body",
      details,
      payload: "PayloadData",
    );
  }

  static Future<void> showRepeatedNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'id2',
      'Repeated Notification',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails details =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      "Repeated Notification",
      "This repeats every minute",
      RepeatInterval.everyMinute,
      details,
      payload: "PayloadData",
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }

  static Future<void> showScheduledNotification(String year, String month,
      String day, String hour, String minutes) async {
    final scheduledTime = tz.TZDateTime(
      tz.local,
      int.parse(year),
      int.parse(month),
      int.parse(day),
      int.parse(hour),
      int.parse(minutes),
    );
    final scheduledTime2 =
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 2));

    final now = tz.TZDateTime.now(tz.local);
    log("Scheduled for: $scheduledTime | Current: $now");

    if (scheduledTime.isBefore(now)) {
      log("❌ Cannot schedule notification in the past.");
      return;
    }

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'id3',
      'Scheduled Notification',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails details =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      "Scheduled Notification",
      "This is a scheduled notification",
      scheduledTime2,
      details,
      payload: "PayloadData",
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
    );
  }

  static Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
