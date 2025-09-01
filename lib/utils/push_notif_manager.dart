import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mobile_habido_v2/bloc/bloc_manager.dart';
import 'package:mobile_habido_v2/helpers/shared_pref.dart';
import 'package:mobile_habido_v2/utils/globals.dart';

import 'func.dart';

PushNotifManager pushNotifManager = PushNotifManager();
FlutterLocalNotificationsPlugin? localNotif;

AndroidNotificationChannel notifChannel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.', // description
  importance: Importance.max,
);

class PushNotifManager {
  late FirebaseApp firebaseApp;
  late FirebaseMessaging messaging;
  FlutterLocalNotificationsPlugin? localNotif;
  // AndroidNotificationChannel? notifChannel; // Local notification

  init() async {
    ///
    /// Firebase app
    ///
    firebaseApp = await Firebase.initializeApp();

    ///
    /// Firebase messaging
    ///
    messaging = FirebaseMessaging.instance;
    if (Platform.isIOS) {
      messaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
    }

    ///
    /// Notification permission
    ///
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

    ///
    /// Push notification token
    ///
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      var currentToken = SharedPref.getPushNotifToken();

      print('Push notif token: ' + currentToken + '\n');
      if (Func.isEmpty(currentToken)) {
        var newToken = await messaging.getToken(); // getToken(vapidKey: "BGpdLRs......"
        if (newToken != null) {
          print(newToken);
          SharedPref.setPushNotifToken(newToken);
        }
      } else {
        messaging.onTokenRefresh.listen((event) {
          print('New token refreshed: ' + event + '\n');
          SharedPref.setPushNotifToken(event);
        });
      }
    }

    ///
    /// Local notification
    ///
    if (Platform.isAndroid) {
      var initSettings = InitializationSettings(android: AndroidInitializationSettings('@mipmap/ic_launcher'));

      localNotif = FlutterLocalNotificationsPlugin();
      await localNotif?.initialize(initSettings, onDidReceiveNotificationResponse: (payload) async {});

      notifChannel = AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description: 'This channel is used for important notifications.', // description
        importance: Importance.max,
      );

      await localNotif?.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(notifChannel!);
      print('Local notif initialized');
    }

    ///
    /// Background message handler
    ///
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    ///
    /// Foreground message handler
    ///
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Logging
      ///TODO
      // if (Platform.isAndroid) {
      //   Func().showNotification(message.notification?.title ?? "", message.notification?.body ?? "", message.data, message.notification);
      // }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) async {
      ///TODO eniig bas gargaj irne
      // PushNotifModel body = PushNotifModel.fromJson(event.data);
      // String jwtToken = SharedPref.getSessionToken();
      // if (event.data.isNotEmpty && jwtToken.isNotEmpty) {
      //   print("onMessageOpenedApp pushed:${event.data}");

      //   Func().notifNavigation(body, event.notification);
      //   BlocManager.userBloc.add(IncreaseTapOfNotifEvent(body.notifHistId ?? 0));
      // }
    });
  }

  _showLocalNotif(RemoteMessage message) async {
    try {
      RemoteNotification? notification = message.notification;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null) {
        // if (notifChannel != null) {

        var notifDetail = NotificationDetails(
          android: AndroidNotificationDetails(
            notifChannel.id,
            notifChannel.name,
            channelDescription: notifChannel.description,
            icon: '@mipmap/ic_launcher',
          ),
        );

        await localNotif?.show(0, notification.title ?? '', notification.body ?? '', notifDetail, payload: 'item x');
        // }
      }
    } catch (e) {
      print(e);
    }
  }
}

// Note: Function заавал тусдаа, class-ын гадна байх ёстой
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await localNotif?.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(notifChannel!);

  globals.unreadNotifCount > 0 ? FlutterAppBadger.updateBadgeCount(globals.unreadNotifCount) : FlutterAppBadger.removeBadge();

  if (Platform.isAndroid) {
    pushNotifManager._showLocalNotif(message);
  }
  print('Handling a background message ${message.messageId}');
}
