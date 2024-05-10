import 'package:flutter/material.dart';
import 'package:mvvmarchecture/res/components/round_button.dart';
import 'package:mvvmarchecture/utils/routes/route.dart';
import 'package:mvvmarchecture/utils/routes/route_name.dart';
import 'package:mvvmarchecture/utils/utils.dart';
import 'package:mvvmarchecture/view/home_view/home_view.dart';
import 'package:mvvmarchecture/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    var height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocus,
            decoration: InputDecoration(
                hintText: 'Email',
                label: Text('Email'),
                prefixIcon: Icon(Icons.alternate_email)),
            onFieldSubmitted: (val) {
              // FocusScope.of(context).requestFocus(passwordFocus);
              Utils.fieldFocusChange(context, emailFocus, passwordFocus);
            },
          ),
          ValueListenableBuilder(
            valueListenable: obsecurePassword,
            builder: (BuildContext context, dynamic value, Widget? child) {
              return TextFormField(
                controller: _password,
                obscureText: obsecurePassword.value,
                obscuringCharacter: '*',
                focusNode: passwordFocus,
                decoration: InputDecoration(
                    hintText: 'Password',
                    label: Text('Password'),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                        onTap: () {
                          obsecurePassword.value = !obsecurePassword.value;
                        },
                        child: Icon(obsecurePassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined))),
              );
            },
          ),
          SizedBox(
            height: height * 0.1,
          ),
          RoundButton(
              title: 'Login',
              loading: authViewModel.loading,
              onPress: () {
                if (_email.text.isEmpty) {
                  Utils.flushBarErrorMessage('enter email', context);
                } else if (_password.text.isEmpty) {
                  Utils.flushBarErrorMessage('enter password', context);
                } else if (_password.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      'please enter 6 digit passowrd', context);
                } else {
                  Map data = {
                    'email': _email.text.toString(),
                    'password': _password.text.toString(),
                  };
                  authViewModel.loginApi(data, context);
                  // Utils.flushBarErrorMessage('api hit', context);
                }
              }),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.signUp);
              },
              child: Text("don't have an account? sign Up"))
        ],
      ),
    ));
  }
}
