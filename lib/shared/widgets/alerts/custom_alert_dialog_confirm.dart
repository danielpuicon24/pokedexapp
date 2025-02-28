import 'package:flutter/material.dart';

import '../../../config/services/service_navigation.dart';

class CustomAlertDialog {
  static error({
    required BuildContext context,
    required String text,
    required String title,
  }) =>
      AlertDialog(
        elevation: 0.1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: Colors.white,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          color: Colors.red[800],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => ServiceNavigation.goBack(),
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                color: Colors.transparent,
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(0, 67, 60, 60),
                  ),
                ),
              ),
            ],
          ),
        ),
        content: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold)),
      );

  static sucess({
    required BuildContext context,
    required String title,
    required Widget body,
    Widget? actions,
  }) {
    return AlertDialog(
      elevation: 0.1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      backgroundColor: Colors.white,
      titlePadding: const EdgeInsets.all(0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              ServiceNavigation.goBack();
            },
            icon: Icon(
              Icons.close,
              color: Colors.green[600],
            ),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.transparent,
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          body,
          const SizedBox(height: 15),
          Icon(
            Icons.check_circle_outline_outlined,
            size: 60,
            color: Colors.green[600],
          ),
          const SizedBox(height: 15),
          actions ?? const SizedBox()
        ],
      ),
    );
  }

  static warning(
          {required BuildContext context,
          String content = '',
          bool showConfirm = true,
          bool showReject = true,
          Function()? onPressedConfirm,
          Function()? onPressedReject,
          String labelConfirmButton = "SI",
          String labelRejectButton = "NO",
          String title = ''}) =>
      AlertDialog(
        elevation: 0.1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            const Expanded(
              flex: 6,
              child: Icon(
                Icons.warning_rounded,
                color: Color.fromARGB(255, 172, 69, 5),
                size: 80,
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () => ServiceNavigation.goBack(result: false),
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                ),
              ),
            ),
          ],
        ),
        content: SizedBox(
          // width: 700,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                ),
                Text(content,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).primaryColor.withOpacity(0.7),
                        fontSize: 17)),
              ],
            ),
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          if (showConfirm) ...[
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                Color.fromARGB(255, 172, 69, 5),
              )),
              onPressed: onPressedConfirm ??
                  () {
                    ServiceNavigation.goBack(result: true);
                  },
              child: Text(labelConfirmButton,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.white, fontSize: 15)),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
          if (showReject) ...[
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                Color.fromARGB(255, 175, 174, 174),
              )),
              onPressed: onPressedReject ??
                  () {
                    ServiceNavigation.goBack(result: false);
                  },
              child: Text(labelRejectButton,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.white, fontSize: 15)),
            ),
          ]
        ],
      );

  static alert({
    required BuildContext context,
    required Widget content,
    String title = "Aviso",
  }) =>
      AlertDialog(
        elevation: 0.1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: Colors.white,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          color: Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () => ServiceNavigation.goBack(),
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                color: Colors.transparent,
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(0, 67, 60, 60),
                  ),
                ),
              ),
            ],
          ),
        ),
        content: content,
      );
}
