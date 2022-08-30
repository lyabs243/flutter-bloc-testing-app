import 'package:flutter_structure/utils/my_material.dart';

class NotificationItem {

  NotificationType type;
  NotificationMode mode;
  String title, description;
  Map<String, dynamic> data;

  NotificationItem({required this.type, this.mode = NotificationMode.external, this.title = '',
    this.description = '', required this.data});

  //the page to open
  String get page {
    switch (type) {
      case NotificationType.none:
        return pageNotification;
    }
  }

  Map<String, dynamic> get arguments {
    switch (type) {
      case NotificationType.none:
        return {argumentMessage: data[fieldNotificationMessage]};
    }
  }

}