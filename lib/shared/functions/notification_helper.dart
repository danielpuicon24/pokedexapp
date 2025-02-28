import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NotificationHelper {
  static void showSuccess(BuildContext context, String? message) {
    ElegantNotification.success(
      // width: 500,
      title: const Text("Aviso"),
      description: Text(message ?? ''),
      position: Alignment.topCenter,
      animation: AnimationType.fromTop,
    ).show(context);
  }

  static void showError(BuildContext context, String? message) {
    ElegantNotification.error(
      // width: 500,
      title: const Text("Error"),
      description: Text(message ?? ''),
      position: Alignment.topCenter,
      animation: AnimationType.fromTop,
    ).show(context);
  }

  static void showDownloadDone(BuildContext context, String? message) {
    ElegantNotification(
      icon: Icon(
        Icons.download,
        color: Theme.of(context).primaryColor,
      ),
      width: kIsWeb ? 500 : null,
      title: const Text("Descarga Exitosa"),
      description: Text(message ?? ''),
      position: Alignment.topRight,
      animation: AnimationType.fromRight,
    ).show(context);
  }

  static void showDownloadError(BuildContext context, String? message) {
    ElegantNotification(
      icon: Icon(
        Icons.file_download_off_outlined,
        color: Colors.red[900],
      ),
      // width: 500,
      title: Text("Descarga Fallida",
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.red[900],
                fontWeight: FontWeight.w500,
              )),
      description: Text(message ?? ''),
      position: Alignment.topRight,
      animation: AnimationType.fromRight,
    ).show(context);
  }
}
