import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode currentNode, FocusNode nextNode) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  static toMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void flushBarErrorMessage(message, context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeOut,
          backgroundColor: Colors.red,
          titleColor: Colors.white,
          duration: Duration(seconds: 3),
          borderRadius: BorderRadius.circular(10),
          icon: Icon(
            Icons.error,
            size: 20,
          ),
          flushbarPosition: FlushbarPosition.TOP,
          message: message,
        )..show(context));
  }

  static showScaffold(context, message) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
