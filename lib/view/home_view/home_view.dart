import 'package:flutter/material.dart';
import 'package:mvvmarchecture/utils/routes/route_name.dart';
import 'package:mvvmarchecture/view_model/user_view_modal.dart';
import 'package:provider/provider.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    var preference = Provider.of<UserViewModel>(context);
    return Scaffold(
        body: Center(
      child: ElevatedButton(
          onPressed: () {
            preference.remove();
            Navigator.pushReplacementNamed(context, RoutesName.login);
          },
          child: Text('LogOut')),
    ));
  }
}
