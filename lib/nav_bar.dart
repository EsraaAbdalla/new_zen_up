// ignore_for_file: library_private_types_in_public_api, avoid_print, use_full_hex_values_for_flutter_colors

import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:new_zen_up/about_us.dart';
import 'package:new_zen_up/original_page.dart';
import 'package:new_zen_up/profile_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavBar(
      actionButton: CurvedActionBar(
          onTab: (value) {
            /// perform action here
            print(value);
          },
          activeIcon: Container(
            padding: const EdgeInsets.all(8),
            // decoration: BoxDecoration(
            //   color: Colors.black,
            //   shape: BoxShape.circle,
            // ),
            child: Image.asset(
              'assets/Zen Up.png',
              width: 71,
              height: 72,
            ),
          ),
          inActiveIcon: Container(
            padding: const EdgeInsets.all(3),
            // decoration:
            // BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            child: Image.asset(
              'assets/Zen Up.png',
              width: 71,
              height: 72,
            ),
          ),
          text: ""),
      activeColor: Colors.white,
      navBarBackgroundColor: const Color(0xFFF302F2F),
      inActiveColor: const Color(0xFFF676D75),
      appBarItems: [
        FABBottomAppBarItem(
            activeIcon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            inActiveIcon: const Icon(
              Icons.home,
              color: Color(0xFFF676D75),
            ),
            text: 'Home'),
        FABBottomAppBarItem(
            activeIcon: const Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
            inActiveIcon: const Icon(
              Icons.play_arrow,
              color: Color(0xFFF676D75),
            ),
            text: 'Play'),
        FABBottomAppBarItem(
            activeIcon: const Icon(
              Icons.person_2_outlined,
              color: Colors.white,
            ),
            inActiveIcon: const Icon(
              Icons.person_2_outlined,
              color: Color(0xFFF676D75),
            ),
            text: 'Profile'),
        FABBottomAppBarItem(
          activeIcon: Image.asset(
            'assets/Vector.png',
          ),
          inActiveIcon: Image.asset(
            'assets/Vector.png',
          ),
          text: 'About Us',
        ),
      ],
      bodyItems: [
        const OriginalPage(),
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
        ),
        const ProfilePage(),
        const AboutUs(),
      ],
      actionBarView: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.orange,
      ),
    );
  }
}
