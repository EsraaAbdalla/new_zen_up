import 'package:go_router/go_router.dart';
import 'package:new_zen_up/Splach/splach_view.dart';
import 'package:new_zen_up/about_us.dart';
import 'package:new_zen_up/contact_us.dart';
import 'package:new_zen_up/nav_bar.dart';
import 'package:new_zen_up/profile_page.dart';
import 'package:new_zen_up/random_audio.dart';

abstract class AppRouter {
  static const kAboutPage = '/loginPage';
  static const kContactUs = '/ContactUs';
  static const kRandomAudio = '/RandomAudio';
  static const kProfilePage = '/ProfilePage';
  static const kNavBar = '/NavBar';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
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
