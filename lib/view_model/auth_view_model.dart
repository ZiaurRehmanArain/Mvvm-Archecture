import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvmarchecture/respository/auth_respository.dart';
import 'package:mvvmarchecture/utils/routes/route_name.dart';
import 'package:mvvmarchecture/utils/utils.dart';
import 'package:mvvmarchecture/view_model/user_view_modal.dart';

class AuthViewModel with ChangeNotifier {
  final _authRespository = AuthRepository();
  bool _loading = false;
  bool _signUploading = false;
  bool get loading => _loading;
  bool get signUploading => _signUploading;

  void setLoading(val) {
    _loading = val;
    notifyListeners();
  }

  void setSignUpLoading(val) {
    _signUploading = val;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRespository.loginApi(data).then((val) {
      Utils.flushBarErrorMessage('Login Sucessful', context);
      setLoading(false);
      Navigator.pushNamed(context, RoutesName.home);

      if (kDebugMode) {
        print("$val register printdsaeta");
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);

        print(error.toString());
      }
    });
  }

  Future<void> SignUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _authRespository.registerApi(data).then((val) {
      Utils.flushBarErrorMessage('Sign Up Sucessful', context);
      setSignUpLoading(false);
      // UserViewModel().saveUser(val);
      Navigator.pushNamed(context, RoutesName.login);

      if (kDebugMode) {
        print("$val register printdsaeta");
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);

      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);

        print(error.toString());
      }
    });
  }
}
