import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_zen_up/Splach/splach_view.dart';
import 'package:new_zen_up/about_us.dart';
import 'package:new_zen_up/auth_container.dart';
import 'package:new_zen_up/contact_us.dart';
import 'package:new_zen_up/forget_password.dart';
import 'package:new_zen_up/nav_bar.dart';
import 'package:new_zen_up/original_page.dart';
import 'package:new_zen_up/profile_page.dart';
import 'package:new_zen_up/random_audio.dart';
import 'package:new_zen_up/uni_test.dart';

abstract class AppRouter {
  static const kAboutPage = '/loginPage';
  static const kContactUs = '/ContactUs';
  static const kRandomAudio = '/RandomAudio';
  static const kProfilePage = '/ProfilePage';
  static const kNavBar = '/NavBar';
  static const kForgetPassword = '/forget-pass';

  static final router = GoRouter(routes: [
    // GoRoute(
    //   path: kForgetPassword,
    //   builder: (context, state) => ForgotPasswordPage(),
    // ),
    GoRoute(
      path: '/',
      builder: (context, state) => AuthContainer(),
    ),
    GoRoute(
      path: '/ForgetPass',
      builder: (context, state) => MyHomePage(),
    ),
    GoRoute(
      path: kAboutPage,
      builder: (context, state) => const AboutUs(),
    ),
    GoRoute(
      path: kContactUs,
      builder: (context, state) => ContactUs(),
    ),
    GoRoute(
      path: kRandomAudio,
      builder: (context, state) => const RandomAudio(),
    ),
    GoRoute(
      path: kProfilePage,
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: kNavBar,
      builder: (context, state) => const NavBar(),
    ),
  ]);
}
