import 'package:flutter/material.dart';
import 'package:mvvmarchecture/utils/routes/route.dart';
import 'package:mvvmarchecture/utils/routes/route_name.dart';
import 'package:mvvmarchecture/view_model/auth_view_model.dart';
import 'package:mvvmarchecture/view_model/user_view_modal.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
