import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvmarchecture/model/user_model.dart';
import 'package:mvvmarchecture/utils/routes/route_name.dart';
import 'package:mvvmarchecture/view_model/user_view_modal.dart';

class SplashServices {
    Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context) async {
    print('f;irst');
    getUserData().then((value) async {
      print(value.token.toString() + 'data');
      // if (value.token.toString().isEmpty || value.token == '') {
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushNamed(context, RoutesName.login);
      // } else {
      //   await Future.delayed(Duration(seconds: 3));

      //   Navigator.pushNamed(context, RoutesName.home);
      // }
    }).catchError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
