import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'ColorHelpers.dart';
import 'plugin/flushbar.dart';

class ViewHelper {
  static void showMobileValidation(BuildContext context) {
    ViewHelper.showErrorDialog(
      context,
      "لطفا شماره موبایل را به درستی وارد کنید",
    );
  }

  static void showNameValidation(BuildContext context) {
    ViewHelper.showErrorDialog(
      context,
      "لطفا نام خود را به صورت کامل وارد کنید",
    );
  }


  static void showErrorDialog(BuildContext context,
      [String text = "خطایی رخ داد"]) {
    Flushbar(
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      borderColor: ColorHelpers.red,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 150.0),
      animationDuration: Duration(milliseconds: 500),
      messageText: AutoSizeText(
        "$text",
        maxLines: 1,
        minFontSize: 3,
        maxFontSize: 12.0,
        style: TextStyle(
          color: ColorHelpers.red,
        ),
      ),
      flushbarPosition: FlushbarPosition.BOTTOM,
      icon: Icon(
        Icons.error_outline,
        size: 28.0,
        color: ColorHelpers.red,
      ),
      duration: Duration(seconds: 2),
    )..show(context);
  }

  static void _baseWarning({
    BuildContext context,
    double height,
    String text,
    Color textColor,
    Color backgroundColor,
    IconData iconData,
    Color borderAndIconColor,
    double borderWidth = 1.0,
    Duration duration = const Duration(seconds: 3),
  }) {
    Flushbar(
      margin: EdgeInsets.symmetric(vertical: height, horizontal: 5.0),
      borderRadius: 10.0,
      borderWidth: borderWidth,
      backgroundColor: backgroundColor,
      animationDuration: Duration(milliseconds: 500),
      messageText: AutoSizeText(
        "$text",
        maxLines: 1,
        minFontSize: 3,
        maxFontSize: 12.0,
        style: TextStyle(
          color: textColor,
        ),
      ),
      flushbarPosition: FlushbarPosition.BOTTOM,
      borderColor: borderAndIconColor,
      icon: Icon(
        iconData,
        size: 28.0,
        color: borderAndIconColor,
      ),
      duration: duration,
    )..show(context);
  }

  static void showRulesValidation(BuildContext context) {
    ViewHelper.showErrorDialog(
      context,
      "لطفا قوانین و مقررات سندباد را مطالعه کرده و آن را بپذیرید",
    );
  }

  static void showSuccessDialog(BuildContext context, String text) {
    Flushbar(
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      borderColor: Colors.green.shade700,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 150.0),
      animationDuration: Duration(milliseconds: 500),
      messageText: AutoSizeText(
        "$text",
        maxLines: 1,
        minFontSize: 3,
        maxFontSize: 12.0,
        style: TextStyle(
          color: Colors.green.shade700,
        ),
      ),
      flushbarPosition: FlushbarPosition.BOTTOM,
      icon: Icon(
        Icons.check_circle,
        size: 28.0,
        color: Colors.green.shade700,
      ),
      duration: Duration(seconds: 3),
    )..show(context);
  }
}