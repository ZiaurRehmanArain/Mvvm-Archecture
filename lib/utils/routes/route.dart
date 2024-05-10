import 'package:flutter/material.dart';
import 'package:mvvmarchecture/utils/routes/route_name.dart';
import 'package:mvvmarchecture/view/home_view/home_view.dart';
import 'package:mvvmarchecture/view/login_view/login_view.dart';
import 'package:mvvmarchecture/view/sign_up_view/sign_up_view.dart';
import 'package:mvvmarchecture/view/splash_view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(setting) {
    switch (setting.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeScreenView());

      case RoutesName.login:
        return MaterialPageRoute(builder: ((context) => LoginView()));
      case RoutesName.signUp:
        return MaterialPageRoute(builder: ((context) => SignUpView()));
      case RoutesName.splash:
        return MaterialPageRoute(builder: ((context) => SplashView()));
      default:
        return MaterialPageRoute(builder: ((context) {
          return MaterialApp(
            home: Scaffold(
              body: Center(child: Text('No route define')),
            ),
          );
        }));
    }
  }
}
