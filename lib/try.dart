// import 'package:flutter/material.dart';

// class Try extends StatelessWidget {
//   const Try({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Container(
//           width: 200,
//           child: Row(
//             children: [
//               Text(
//                 "Awarness",
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             image: DecorationImage(
//               image: AssetImage('assets/Group.png'),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// import 'dart:developer';
// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
// import 'package:flutter/material.dart';

// // // void main() {
// // //   runApp(const MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({Key? key}) : super(key: key);
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Animated Notch Bottom Bar',
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.blue,
// // //       ),
// // //       home: const MyHomePage(),
// // //     );
// // //   }
// // // }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   /// Controller to handle PageView and also handles initial page
//   final _pageController = PageController(initialPage: 0);

//   /// Controller to handle bottom nav bar and also handles initial page
//   final _controller = NotchBottomBarController(index: 0);

//   int maxCount = 6;

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   /// widget list
//   final List<Widget> bottomBarPages = [
//     const Page1(),
//     const Page2(),
//     const Page3(),
//     const Page4(),
//     const Page5(),
//     const Page6(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         physics: const NeverScrollableScrollPhysics(),
//         children: List.generate(
//             bottomBarPages.length, (index) => bottomBarPages[index]),
//       ),
//       extendBody: true,
//       bottomNavigationBar: (bottomBarPages.length <= maxCount)
//           ? AnimatedNotchBottomBar(
//               /// Provide NotchBottomBarController
//               notchBottomBarController: _controller,
//               color: Colors.white,
//               showLabel: false,
//               notchColor: Colors.black87,

//               /// restart app if you change removeMargins
//               removeMargins: false,
//               bottomBarWidth: 50,
//               durationInMilliSeconds: 200,
//               bottomBarItems: [
//                 const BottomBarItem(
//                   inActiveItem: Text(
//                     'A',
//                     style: TextStyle(color: Colors.blueAccent),
//                   ),
//                   activeItem: Text(
//                     'A',
//                     style: TextStyle(
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   itemLabel: 'Page 1',
//                 ),
//                 const BottomBarItem(
//                   inActiveItem: Text(
//                     'B',
//                     style: TextStyle(color: Colors.blueAccent),
//                   ),
//                   activeItem: Text(
//                     'B',
//                     style: TextStyle(color: Colors.blueAccent),
//                   ),
//                   itemLabel: 'Page 2',
//                 ),

//                 ///svg example
//                 BottomBarItem(
//                   inActiveItem: Text(
//                     'C',
//                     style: TextStyle(color: Colors.blueAccent),
//                   ),
//                   activeItem: Text(
//                     'C',
//                     style: TextStyle(color: Colors.blueAccent),
//                   ),
//                   itemLabel: 'Page 3',
//                 ),
//                 BottomBarItem(
//                   inActiveItem: Text(
//                     'F',
//                     style: TextStyle(color: Colors.blueAccent),
//                   ),
//                   activeItem: Text(
//                     'F',
//                     style: TextStyle(color: Colors.blueAccent),
//                   ),
//                   itemLabel: 'Page 4',
//                 ),
//                 const BottomBarItem(
//                   inActiveItem: Text(
//                     'G',
//                     style: TextStyle(color: Colors.blueAccent),
//                   ),
//                   activeItem: Text(
//                     'G',
//                     style: TextStyle(color: Colors.blueAccent),
//                   ),
//                   itemLabel: 'Page 5',
//                 ),
//                 // const BottomBarItem(
//                 //   inActiveItem: Text(
//                 //     'H',
//                 //     style: TextStyle(color: Colors.blueAccent),
//                 //   ),
//                 //   activeItem: Text(
//                 //     'H',
//                 //     style: TextStyle(color: Colors.blueAccent),
//                 //   ),
//                 //   itemLabel: 'Page 6',
//                 // ),
//               ],
//               onTap: (index) {
//                 /// perform action on tab change and to update pages you can update pages without pages
//                 log('current selected index $index');
//                 _pageController.jumpToPage(index);
//               },
//             )
//           : null,
//     );
//   }
// }

// class Page1 extends StatelessWidget {
//   const Page1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.yellow, child: const Center(child: Text('Page 1')));
//   }
// }

// class Page2 extends StatelessWidget {
//   const Page2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.green, child: const Center(child: Text('Page 2')));
//   }
// }

// class Page3 extends StatelessWidget {
//   const Page3({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.red, child: const Center(child: Text('Page 3')));
//   }
// }

// class Page4 extends StatelessWidget {
//   const Page4({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.blue, child: const Center(child: Text('Page 4')));
//   }
// }

// class Page5 extends StatelessWidget {
//   const Page5({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.lightGreenAccent,
//         child: const Center(child: Text('Page 5')));
//   }
// }

// class Page6 extends StatelessWidget {
//   const Page6({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.orange, child: const Center(child: Text('Page 6')));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
// import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
// import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
// import 'package:new_zen_up/home_page.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Motion Tab Bar Sample',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Motion Tab Bar Sample'),
//     );
//   }
// }
//??????????????????????????????????????????
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, this.title}) : super(key: key);

//   final String? title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   // TabController? _tabController;
//   MotionTabBarController? _motionTabBarController;

//   @override
//   void initState() {
//     super.initState();
//     //// Use normal tab controller
//     // _tabController = TabController(
//     //   initialIndex: 1,
//     //   length: 4,
//     //   vsync: this,
//     // );

//     //// use "MotionTabBarController" to replace with "TabController", if you need to programmatically change the tab
//     _motionTabBarController = MotionTabBarController(
//       initialIndex: 1,
//       length: 4,
//       vsync: this,
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _motionTabBarController!.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title!),
//       ),
//       bottomNavigationBar: MotionTabBar(
//         controller:
//             _motionTabBarController, // ADD THIS if you need to change your tab programmatically
//         initialSelectedTab: "Home",
//         useSafeArea: true, // default: true, apply safe area wrapper
//         labels: const ["Dashboard", "Home", "Profile", "Settings"],
//         icons: const [
//           Icons.dashboard,
//           Icons.home,
//           Icons.people_alt,
//           Icons.settings
//         ],

//         // optional badges, length must be same with labels
//         badges: [
//           // Default Motion Badge Widget
//           const MotionBadgeWidget(
//             text: '99+',
//             textColor: Colors.white, // optional, default to Colors.white
//             color: Colors.red, // optional, default to Colors.red
//             size: 18, // optional, default to 18
//           ),

//           // custom badge Widget
//           Container(
//             color: Colors.black,
//             padding: const EdgeInsets.all(2),
//             child: const Text(
//               '48',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.white,
//               ),
//             ),
//           ),

//           // allow null
//           null,

//           // Default Motion Badge Widget with indicator only
//           const MotionBadgeWidget(
//             isIndicator: true,
//             color: Colors.red, // optional, default to Colors.red
//             size: 5, // optional, default to 5,
//             show: true, // true / false
//           ),
//         ],
//         tabSize: 50,
//         tabBarHeight: 55,
//         textStyle: const TextStyle(
//           fontSize: 12,
//           color: Colors.black,
//           fontWeight: FontWeight.w500,
//         ),
//         tabIconColor: Colors.blue[600],
//         tabIconSize: 28.0,
//         tabIconSelectedSize: 26.0,
//         tabSelectedColor: Colors.blue[900],
//         tabIconSelectedColor: Colors.white,
//         tabBarColor: const Color(0xFFAFAFAF),
//         onTabItemSelected: (int value) {
//           setState(() {
//             _motionTabBarController!.index = value;
//           });
//         },
//       ),
//       body: TabBarView(
//         physics:
//             const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
//         controller: _motionTabBarController,
//         children: <Widget>[
//           MainPageContentComponent(
//               title: "Dashboard Page", controller: _motionTabBarController!),
//           MainPageContentComponent(
//               title: "Home Page", controller: _motionTabBarController!),
//           MainPageContentComponent(
//               title: "Profile Page", controller: _motionTabBarController!),
//           MainPageContentComponent(
//               title: "Settings Page", controller: _motionTabBarController!),
//         ],
//       ),
//     );
//   }
// }

// class MainPageContentComponent extends StatelessWidget {
//   const MainPageContentComponent({
//     required this.title,
//     required this.controller,
//     Key? key,
//   }) : super(key: key);

//   final String title;
//   final MotionTabBarController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(title,
//               style:
//                   const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 50),
//           const Text('Go to "X" page programmatically'),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () => controller.index = 0,
//             child: const Text('Dashboard Page'),
//           ),
//           ElevatedButton(
//             onPressed: () => controller.index = 1,
//             child: const Text('Home Page'),
//           ),
//           ElevatedButton(
//             onPressed: () => controller.index = 2,
//             child: const Text('Profile Page'),
//           ),
//           ElevatedButton(
//             onPressed: () => controller.index = 3,
//             child: const Text('Settings Page'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

// class MoltNavBar extends StatefulWidget {
//   @override
//   _MoltNavBarState createState() => _MoltNavBarState();
// }

// class _MoltNavBarState extends State<MoltNavBar> {
//   // a variable to store the current selected tab. can be used to control PageView
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: Theme.of(context).copyWith(
//         backgroundColor: Colors.black,
//         // primaryColor: Colors.deepPurple[400],
//         colorScheme: ColorScheme.fromSwatch(
//           primarySwatch: Colors.deepPurple,
//         ),
//       ),
//       home: Scaffold(
//         body: Center(
//           child: Text(
//             'Selected Tab: $_selectedIndex',
//             style: TextStyle(
//               fontSize: 20,
//             ),
//           ),
//         ),
//         backgroundColor: Colors.deepPurple[400],
//         // you can use the molten bar in the scaffold's bottomNavigationBar
//         bottomNavigationBar: MoltenBottomNavigationBar(
//           selectedIndex: _selectedIndex,
//           domeHeight: 25,
//           // specify what will happen when a tab is clicked
//           onTabChange: (clickedIndex) {
//             setState(() {
//               _selectedIndex = clickedIndex;
//             });
//           },
//           // ansert as many tabs as you like
//           tabs: [
//             MoltenTab(
//               icon: Icon(Icons.search),

//               // selectedColor: Colors.yellow,
//             ),
//             MoltenTab(
//               icon: Icon(Icons.search),

//               // selectedColor: Colors.yellow,
//             ),
//             MoltenTab(
//               icon: Icon(Icons.search),

//               // selectedColor: Colors.yellow,
//             ),
//             MoltenTab(
//               icon: Icon(Icons.search),

//               // selectedColor: Colors.yellow,
//             ),
//             MoltenTab(
//               icon: Icon(Icons.home),
//               title: Text('home'),
//               // selectedColor: Colors.yellow,
//             ),
//             MoltenTab(
//               icon: Icon(Icons.person),
//               selectedColor: Colors.yellow,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, this.title}) : super(key: key);

//   final String? title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final List<CircleData> circles = [
//     CircleData(
//       character: 'A',
//       page: HomePage(),
//     ),
//     CircleData(
//       character: 'B',
//       page: HomePage(),
//     ),
//     CircleData(
//       character: 'C',
//       page: HomePage(),
//     ),
//     CircleData(
//       character: 'F',
//       page: HomePage(),
//     ),
//     CircleData(
//       character: 'G',
//       page: HomePage(),
//     ),
//     CircleData(
//       character: 'H',
//       page: HomePage(),
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title!),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Tap on a circle to navigate',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 50),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: circles.map((circle) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => circle.page),
//                     );
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.blue,
//                     ),
//                     child: Center(
//                       child: Text(
//                         circle.character,
//                         style: TextStyle(
//                           fontSize: 24,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     width: 80,
//                     height: 80,
//                   ),
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CircleData {
//   final String character;
//   final Widget page;

//   CircleData({required this.character, required this.page});
// }


// ignore_for_file: public_member_api_docs

// FOR MORE EXAMPLES, VISIT THE GITHUB REPOSITORY AT:
//
//  https://github.com/ryanheise/audio_service
//
// This example implements a minimal audio handler that renders the current
// media item and playback state to the system notification and responds to 4
// media actions:
//
// - play
// - pause
// - seek
// - stop
//
// To run this example, use:
//
// flutter run

