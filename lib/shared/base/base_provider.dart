import 'package:flutter/material.dart';

import '../../config/constants/enum.dart';
import '../../config/services/service_navigation.dart';
import '../functions/notification_helper.dart';

mixin class BaseProvider {
  String namePage = "";

  bool isEmail(String value) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }

  void onErrorShow(String message) {
    if (message.startsWith("Error:")) {
      ServiceNavigation.showDialogError(title: "ERROR", text: message);
      return;
    }

    ServiceNavigation.showDialogWarning(
      title: "ADVERTENCIA",
      content: message,
      showReject: false,
      labelConfirmButton: "Aceptar",
    );
  }

  Future onErrorShowAsync(String message) async {
    if (message.startsWith("Error:")) {
      await ServiceNavigation.showDialogError(title: "ERROR", text: message);
      return;
    }

    await ServiceNavigation.showDialogWarning(
      title: "ADVERTENCIA",
      content: message,
      showReject: false,
      labelConfirmButton: "Aceptar",
    );
  }

  sendEvent({
    required String message,
    required EnumMessageAction messageAction,
    BuildContext? context,
  }) {
    switch (messageAction) {
      case EnumMessageAction.done:
        NotificationHelper.showSuccess(
          // context ?? NotificactionService.contextGlobal!,
          context ?? ServiceNavigation.globalKey.currentContext!,
          // context ?? pageKey.currentContext!,
          message,
        );
        break;
      case EnumMessageAction.error:
        NotificationHelper.showError(
          // context ?? NotificactionService.contextGlobal!,
          context ?? ServiceNavigation.globalKey.currentContext!,
          // context ?? pageKey.currentContext!,
          message,
        );
        break;
      case EnumMessageAction.downloadDone:
        NotificationHelper.showDownloadDone(
          // context ?? NotificactionService.contextGlobal!,
          context ?? ServiceNavigation.globalKey.currentContext!,
          // context ?? pageKey.currentContext!,
          message,
        );
        break;
      case EnumMessageAction.downloadError:
        NotificationHelper.showDownloadError(
          // context ?? NotificactionService.contextGlobal!,
          context ?? ServiceNavigation.globalKey.currentContext!,
          // context ?? pageKey.currentContext!,
          message,
        );
    }
  }
}
