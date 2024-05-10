import 'package:flutter/material.dart';
import 'package:mvvmarchecture/res/color.dart';

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  String title;
  bool loading;

  final Function onPress;

  RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Container(
        height: 40,
        width: 200,
        // ignore: sort_child_properties_last
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: TextStyle(
                      color: appColor.textPrimaryColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 14),
                ),
        ),
        decoration: BoxDecoration(
            color: appColor.greenColor,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
