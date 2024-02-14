import 'package:shoe_app/app/data/enums/notification_type.dart';

class NotificationModel {
  String title;
  String message;
  NotificationType notificationType;
  NotificationModel({
    required this.title,
    required this.message,
    required this.notificationType,
  });
}

List<NotificationModel> notifications = [
  NotificationModel(
      title: 'Completed Your Trip',
      message:
          'Lorem ipsum dolor sit amet, consectetur the adipiscing elit consectetur the adipiscing elit.',
      notificationType: NotificationType.done),
  NotificationModel(
      title: 'Just Now your car came',
      message:
          'Lorem ipsum dolor sit amet, consectetur the adipiscing elit consectetur the adipiscing elit.',
      notificationType: NotificationType.delivery),
  NotificationModel(
      title: '30% Offer just for Now',
      message:
          'Lorem ipsum dolor sit amet, consectetur the adipiscing elit consectetur the adipiscing elit.',
      notificationType: NotificationType.offer),
];
