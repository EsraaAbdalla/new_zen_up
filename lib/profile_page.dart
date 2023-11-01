// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:new_zen_up/about_us.dart';
import 'package:new_zen_up/constant.dart';
import 'package:new_zen_up/contact_us.dart';
import 'package:new_zen_up/reset_pass.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0XFFFABABAB),
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/Group 12558.png', // Replace with your image URL
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: 60,
                  left:
                      30, // Adjust this value to change the vertical position of the title
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 17,
                    ),
                  )),
            ],
          ),
          const Text(
            'Mohamoud Saad',
            style: TextStyle(
              color: Color(0XFFFC150F6),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19, right: 19, top: 12),
            child: Ink(
              width: MediaQuery.of(context).size.width,
              height: 450,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 197, 191, 191),
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //Box
                  ]),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          const Color(0XFFF0601B4).withOpacity(0.05),
                      child: const Icon(
                        Icons.favorite,
                        color: Color(0XFFFC150F6),
                      ), // Background color of the CircleAvatar
                    ),
                    title: const Text(
                      'My Favorite',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: const Text('Go to your favorite mixed audios',
                        style: TextStyle(color: Color(0XFFFABABAB))),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Color(0XFFFABABAB)),
                    onTap: () {
                      // Handle the onTap event for Item 1
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          const Color(0XFFF0601B4).withOpacity(0.05),
                      child: const Icon(
                        Icons.collections_bookmark,
                        color: Color(0XFFFC150F6),
                      ), // Background color of the CircleAvatar
                    ),
                    title: const Text(
                      'Play History',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: const Text('Listen to your last mixed audio',
                        style: TextStyle(color: Color(0XFFFABABAB))),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Color(0XFFFABABAB)),
                    onTap: () {
                      // Handle the onTap event for Item 1
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          const Color(0XFFF0601B4).withOpacity(0.05),
                      child: const Icon(
                        Icons.attach_money_outlined,
                        color: Color(0XFFFC150F6),
                      ), // Background color of the CircleAvatar
                    ),
                    title: const Text(
                      'Payment',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: const Text('Manage your payment ',
                        style: TextStyle(color: Color(0XFFFABABAB))),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Color(0XFFFABABAB)),
                    onTap: () {
                      // Handle the onTap event for Item 1
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          const Color(0XFFF0601B4).withOpacity(0.05),
                      child: const Icon(
                        Icons.lock,
                        color: Color(0XFFFC150F6),
                      ), // Background color of the CircleAvatar
                    ),
                    title: const Text(
                      'Reset Password',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: const Text('If you forget your password',
                        style: TextStyle(color: Color(0XFFFABABAB))),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Color(0XFFFABABAB)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetPasswordPage()),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          const Color(0XFFF0601B4).withOpacity(0.05),
                      child: const Icon(
                        Icons.logout,
                        color: Color(0XFFFC150F6),
                      ), // Background color of the CircleAvatar
                    ),
                    title: const Text(
                      'Log out',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: const Text('Log out from your profile',
                        style: TextStyle(color: Color(0XFFFABABAB))),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Color(0XFFFABABAB)),
                    onTap: () {
                      // Handle the onTap event for Item 1
                    },
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 28),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'More',
                style: TextStyle(
                    color: Color(0XFFF181D27),
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 19, right: 19, top: 12, bottom: 70),
            child: Ink(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 197, 191, 191),
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //Box
                  ]),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          const Color(0XFFF0601B4).withOpacity(0.05),
                      child: const Icon(
                        Icons.perm_contact_cal_rounded,
                        color: Color(0XFFFC150F6),
                      ), // Background color of the CircleAvatar
                    ),
                    title: const Text(
                      'Contact Us',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Color(0XFFFABABAB)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactUs()),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          const Color(0XFFF0601B4).withOpacity(0.05),
                      child: const Icon(
                        Icons.favorite_border_outlined,
                        color: Color(0XFFFC150F6),
                      ), // Background color of the CircleAvatar
                    ),
                    title: const Text(
                      'About App',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Color(0XFFFABABAB)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUs()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
