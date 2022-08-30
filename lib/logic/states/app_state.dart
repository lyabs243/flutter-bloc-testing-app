import 'package:flutter_structure/data/models/notification_item.dart';
import 'package:flutter_structure/utils/enums.dart';

class AppState {

  CustomState loadingState;
  NotificationItem? notification;

  AppState({this.loadingState = CustomState.loading, this.notification});

  AppState copy() {
    AppState copy = AppState(loadingState: loadingState, notification: notification);

    return copy;
  }

}