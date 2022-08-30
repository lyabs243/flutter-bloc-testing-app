import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/data/models/notification_item.dart';
import 'package:flutter_structure/data/tests/app_test.dart';
import 'package:flutter_structure/logic/states/app_state.dart';
import 'package:flutter_structure/utils/enums.dart';
import 'package:flutter_structure/utils/my_material.dart';

class AppCubit extends Cubit<AppState> {

  AppCubit(AppState initialState) : super(initialState) {
    intiData();
  }

  intiData() async {
    AppTest.run();
    state.loadingState = CustomState.loading;
    emit(state.copy());

    await _initCloudMessaging();

    state.loadingState = CustomState.done;
    emit(state.copy());
  }

  Future _initCloudMessaging() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    //String? notificationToken = await FirebaseMessaging.instance.getToken();
    //debugPrint('===============Notification token: $notificationToken');

    RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      _openNotification(message,);
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _openNotification(message, mode: NotificationMode.inApp);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      _openNotification(message,);
    });
  }

  Future _openNotification(RemoteMessage message, {mode = NotificationMode.external}) async {
    Map<String, dynamic> data = message.data;

    debugPrint('=======Notification: $data == ${message.notification?.title?? ''}');
    NotificationType? notificationType = NotificationType.getType(data[fieldNotificationType]);

    if (notificationType != null) {
      state.notification = NotificationItem(type: notificationType, data: data, mode: mode,
        title: message.notification?.title?? '', description: message.notification?.body?? '',);
    }

    emit(state.copy());
  }

}