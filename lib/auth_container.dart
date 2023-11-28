import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:new_zen_up/Splach/splach_view.dart';
import 'package:new_zen_up/app_router.dart';
import 'package:new_zen_up/original_page.dart';
import 'package:new_zen_up/shareed_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthContainer extends StatefulWidget {
  const AuthContainer({super.key});

  @override
  State<AuthContainer> createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
  String? token;
  bool intial = true;

  @override
  Widget build(BuildContext context) {
    if (intial) {
      // intial = false;
      SharedPreferences.getInstance().then((sharedPreferencesValue) {
        setState(() {
          intial = false;
          token = sharedPreferencesValue.getString('token');
          print(token);
        });
      });
      return const CircularProgressIndicator();
    } else {
      // print();
      if (token == null) {
        return SplashView();
      } else {
        return OriginalPage();
      }
    }
  }
}
