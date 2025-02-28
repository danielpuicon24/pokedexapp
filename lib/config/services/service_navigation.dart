import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/widgets/alerts/custom_alert_dialog_confirm.dart';


class ServiceNavigation {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey globalKey = GlobalKey();

  static Future replaceRemoveUntil(String routeName,
      {dynamic arguments}) async {
    while (navigatorKey.currentContext!.canPop()) {
      navigatorKey.currentContext!.pop();
    }
    navigatorKey.currentContext!.replace(
      routeName,
      extra: arguments,
    );
    return;
  }

  static Future pushRemoveUntil(String routeName, {dynamic arguments}) async {
    while (navigatorKey.currentContext!.canPop()) {
      navigatorKey.currentContext!.pop();
    }
    await navigatorKey.currentContext!.push(
      routeName,
      extra: arguments,
    );
    return;
  }

  static replace(String routeName, {dynamic arguments}) {
    return navigatorKey.currentContext!.replace(
      routeName,
      extra: arguments,
    );
  }

  static Future push(String routeName, {dynamic arguments}) async {
    return await navigatorKey.currentContext!.push(
      routeName,
      extra: arguments,
    );
  }

  static goBack({dynamic result}) {
    return navigatorKey.currentContext!.pop(result);
  }

  static showLoading({String text = ""}) {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
      },
    );
  }

  static Future showDialogSucces({
    BuildContext? context,
    String title = '',
    required Widget body,
    Widget? actions,
  }) async {
    return await showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => CustomAlertDialog.sucess(
        context: context,
        title: title,
        body: body,
        actions: actions,
      ),
    );
  }

  static Future showDialogWarning(
      {BuildContext? context,
      String content = '',
      Function()? onPressedConfirm,
      Function()? onPressedReject,
      bool showConfirm = true,
      bool showReject = true,
      String labelConfirmButton = "SI",
      String labelRejectButton = "NO",
      String title = ''}) async {
    return await showDialog(
      context: context ?? navigatorKey.currentContext!,
      builder: (context) => CustomAlertDialog.warning(
        content: content,
        context: context,
        onPressedConfirm: onPressedConfirm,
        onPressedReject: onPressedReject,
        labelConfirmButton: labelConfirmButton,
        labelRejectButton: labelRejectButton,
        title: title,
        showConfirm: showConfirm,
        showReject: showReject,
      ),
    );
  }

  static Future showAlert({
    BuildContext? context,
    required Widget content,
    String title = "Aviso",
  }) async {
    return await showDialog(
      context: context ?? navigatorKey.currentContext!,
      barrierDismissible: true,
      builder: (context) => CustomAlertDialog.alert(
        context: context,
        content: content,
        title: title,
      ),
    );
  }

  static Future showDialogError({
    BuildContext? context,
    required String title,
    required String text,
  }) async {
    return await showDialog(
      context: context ?? navigatorKey.currentContext!,
      builder: (context) => CustomAlertDialog.error(
        context: context,
        title: title,
        text: text,
      ),
    );
  }
}
