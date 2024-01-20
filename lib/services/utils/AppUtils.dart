import 'package:flutter/material.dart';

class AppUtils {
  static Widget getWidgetFromFuture<T>(
      BuildContext context, AsyncSnapshot<T> snapshot, Widget successWidget) {
    if (snapshot.hasData) {
      return successWidget;
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      // return CircularProgressIndicator(
      //   value: null,
      //   strokeWidth: 7.0,
      // );
      return SizedBox();
    }

    if (snapshot.hasError) {
      showError(context, 'BE: Technical Error, please Try again later!');
    }

    return SizedBox();
  }


  static void showError(BuildContext context, String errorMessage) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(Icons.error_outline_sharp, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              children: [
                Text(
                  errorMessage,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ), //StadiumBorder(),
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);

  }
}
