import 'package:flutter_structure/data/models/notification_item.dart';
import 'package:flutter_structure/utils/my_material.dart';
import 'package:overlay_support/overlay_support.dart';

class LocalNotificationWidget extends StatelessWidget {

  final NotificationItem notification;

  const LocalNotificationWidget({required this.notification, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key('in-app-notification'),
      confirmDismiss: (direction) async {
        OverlaySupportEntry.of(context)!.dismiss();
        return true;
      },
      onDismissed: (direction) {
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: SafeArea(
          child: ListTile(
            leading: SizedBox.fromSize(
                size: const Size(40, 40),
                child: const ClipOval(child: Icon(Icons.notifications))
            ),
            title: Text(notification.title),
            subtitle: Text(notification.description),
            trailing: TextButton(
              onPressed: () {
                OverlaySupportEntry.of(context)!.dismiss();
                Navigator.of(context).pushNamed(notification.page, arguments: notification.arguments);
              },
              child: Text(
                AppLocalizations.of(context)!.view.toUpperCase(),
              ),
            ),
          ),
        ),
      ),
    );
  }

}