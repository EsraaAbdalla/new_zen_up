// // ignore_for_file: use_full_hex_values_for_flutter_colors

// import 'package:flutter/material.dart';
// import 'package:new_zen_up/home_page.dart';
// import 'package:new_zen_up/random_audio.dart';

// class OriginalPage extends StatelessWidget {
//   const OriginalPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width - 9,
//                   height: MediaQuery.of(context).size.height * 0.25,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage(
//                           'assets/Rectangle 2.png',
//                         ),
//                         fit: BoxFit.fill),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(50),
//                       bottomRight: Radius.circular(50),
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Awareness',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: MediaQuery.of(context).size.width * 0.07,
//                         ),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.025,
//                       ),
//                       Text(
//                         'Breathing',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: MediaQuery.of(context).size.width * 0.07,
//                         ),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.025,
//                       ),
//                       Text(
//                         'Compassion',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: MediaQuery.of(context).size.width * 0.07,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width - 9,
//                   height: MediaQuery.of(context).size.height * 0.3,
//                   decoration: BoxDecoration(
//                     image: const DecorationImage(
//                       image: AssetImage(
//                         'assets/Rectangle 3.png',
//                       ),
//                       fit: BoxFit.fill,
//                     ),
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.03,
//                       ),
//                       Text(
//                         'Forgiveness',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: MediaQuery.of(context).size.width * 0.07,
//                         ),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.025,
//                       ),
//                       Text(
//                         'Gratitude',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: MediaQuery.of(context).size.width * 0.07,
//                         ),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//                       ),
//                       Text(
//                         'Happiness',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: MediaQuery.of(context).size.width * 0.07,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const HomePage(
//                                 CatName: 'Awareness',
//                                 imageName: 'assets/Group 3160.png',
//                                 color1: Color(0xFFFFF3F3F),
//                                 color2: Color(0xFFFFF3F3F),
//                                 // audioBloc: AudioBloc(),
//                                 CatChar: "A",
//                               )),
//                     );
//                   },
//                   child: const ChooseButton(
//                     text: "Program your own personalized meditation",
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.01,
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: const ChooseButton(
//                     text: "Play previous program",
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.01,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const RandomAudio(),
//                       ),
//                     );
//                   },
//                   child: const ChooseButton(
//                     text: "Choose by number of minutes",
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: library_private_types_in_public_api, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

import 'package:new_zen_up/constant.dart';
import 'package:new_zen_up/home_page.dart';

import 'package:new_zen_up/profile_page.dart';
import 'package:new_zen_up/random_audio.dart';

class OriginalPage extends StatefulWidget {
  const OriginalPage({super.key});

  @override
  _OriginalPageState createState() => _OriginalPageState();
}

class _OriginalPageState extends State<OriginalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/home.png',
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                ),
                // Images and Text Column
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.08,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors
                                        .white, // Set your desired border color
                                    width: 4.0, // Set the border width
                                  ),
                                  // borderRadius: BorderRadius.circular(
                                  //     8.0), // Set border radius if needed
                                ),
                                child: Image.asset(
                                  'assets/1 (1).png',
                                  // fit: BoxFit.fill,
                                  fit: BoxFit.contain,
                                  width:
                                      MediaQuery.of(context).size.width * 0.19,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                ),
                              ),
                              const Text(
                                'Awareness',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors
                                        .white, // Set your desired border color
                                    width: 4.0, // Set the border width
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/10.png',
                                  fit: BoxFit.contain,
                                  width:
                                      MediaQuery.of(context).size.width * 0.19,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                ),
                              ),
                              const Text(
                                'Breathing',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors
                                        .white, // Set your desired border color
                                    width: 4.0, // Set the border width
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/3-2.png',
                                  fit: BoxFit.contain,
                                  width:
                                      MediaQuery.of(context).size.width * 0.19,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                ),
                              ),
                              const Text(
                                'Compassion',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors
                                          .white, // Set your desired border color
                                      width: 4.0, // Set the border width
                                    ),
                                  ),
                                  child: Image.asset(
                                    fit: BoxFit.contain,
                                    'assets/9.png',
                                    width: MediaQuery.of(context).size.width *
                                        0.19,
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                  ),
                                ),
                                const Text(
                                  'Forgiveness',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors
                                          .white, // Set your desired border color
                                      width: 4.0, // Set the border width
                                    ),
                                  ),
                                  child: Image.asset(
                                    'assets/8.png',
                                    fit: BoxFit.contain,
                                    width: MediaQuery.of(context).size.width *
                                        0.19,
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                  ),
                                ),
                                const Text(
                                  'Gratitude',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors
                                          .white, // Set your desired border color
                                      width: 4.0, // Set the border width
                                    ),
                                  ),
                                  child: Image.asset(
                                    fit: BoxFit.contain,
                                    'assets/7.png',
                                    width: MediaQuery.of(context).size.width *
                                        0.19,
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                  ),
                                ),
                                const Text(
                                  'Happiness',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(
                      CatName: 'Awareness',
                      imageName: 'assets/Group 3160.png',
                      color1: Color(0xFFFFF3F3F),
                      color2: Color(0xFFFFF3F3F),
                      CatChar: "A",
                    ),
                  ),
                );
              },
              child: const ChooseButton(
                text: "Personalise your 6-elements",
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            GestureDetector(
              onTap: () {},
              child: const ChooseButton(
                text: "Play previous",
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RandomAudio(),
                  ),
                );
              },
              child: const ChooseButton(
                text: "Choose by no. of mins",
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
        color: kPrimaryColor,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Transform.translate(
          offset: const Offset(0.0, -30.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: const Color(0XFFF8460F4),
                  width: 2.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.person_2_outlined,
                    color: Color(0XFFF8460F4),
                    size: 30.0,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: Color(0XFFF8460F4),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChooseButton extends StatelessWidget {
  final String text;
  const ChooseButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    Color defaultColor =
        const Color(0XFFF7F5DF4).withOpacity(0.5); // Default color
    Color hoverColor =
        const Color(0XFFF8460F4).withOpacity(0.5); // Color when hovered
    return Container(
      width: MediaQuery.of(context).size.width - 12,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: hoverColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                maxLines: 2, // Set the maximum number of lines
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: defaultColor,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                height: MediaQuery.of(context).size.height * 0.1,
                child: const Image(image: AssetImage('assets/arrow.png'))),
          ],
        ),
      ),
    );
  }
}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// import 'package:flutter/material.dart';

// class OriginalPage extends StatelessWidget {
//   const OriginalPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ListView.builder(
//           itemCount: 2, // Number of containers
//           itemBuilder: (context, index) {
//             return Container(
//               margin: EdgeInsets.only(top: 0, bottom: 0), // Remove any margin
//               child: Column(
//                 children: [
//                   Text(
//                     index == 0
//                         ? 'Awareness'
//                         : 'Forgiveness', // Adjust text accordingly
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: MediaQuery.of(context).size.width * 0.07,
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.025,
//                   ),
//                   Text(
//                     index == 0
//                         ? 'Breathing'
//                         : 'Gratitude', // Adjust text accordingly
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: MediaQuery.of(context).size.width * 0.07,
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.025,
//                   ),
//                   Text(
//                     index == 0
//                         ? 'Compassion'
//                         : 'Happiness', // Adjust text accordingly
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: MediaQuery.of(context).size.width * 0.07,
//                     ),
//                   ),
//                 ],
//               ),
//               width: MediaQuery.of(context).size.width - 9,
//               height: MediaQuery.of(context).size.height * 0.25,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(index == 0
//                       ? 'assets/Rectangle 2.png'
//                       : 'assets/Rectangle 3.png'), // Adjust image path accordingly
//                   fit: BoxFit.fill,
//                 ),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(50),
//                   bottomRight: Radius.circular(50),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class OriginalPage extends StatelessWidget {
//   const OriginalPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween, // Added this line
//           children: [
//             Container(
//               child: Column(
//                 children: [
//                   Text(
//                     'Awareness',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: MediaQuery.of(context).size.width * 0.07,
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.025,
//                   ),
//                   Text(
//                     'Breathing',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: MediaQuery.of(context).size.width * 0.07,
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.025,
//                   ),
//                   Text(
//                     'Compassion',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: MediaQuery.of(context).size.width * 0.07,
//                     ),
//                   ),
//                 ],
//               ),
//               width: MediaQuery.of(context).size.width - 9,
//               height: MediaQuery.of(context).size.height * 0.25,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/Rectangle 2.png'),
//                   fit: BoxFit.fill,
//                 ),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(50),
//                   bottomRight: Radius.circular(50),
//                 ),
//               ),
//             ),
//             Container(
//               child: Column(
//                 children: [
//                   Text(
//                     'Forgiveness',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: MediaQuery.of(context).size.width * 0.07,
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.025,
//                   ),
//                   Text(
//                     'Gratitude',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: MediaQuery.of(context).size.width * 0.07,
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.025,
//                   ),
//                   Text(
//                     'Happiness',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: MediaQuery.of(context).size.width * 0.07,
//                     ),
//                   ),
//                 ],
//               ),
//               width: MediaQuery.of(context).size.width - 9,
//               height: MediaQuery.of(context).size.height * 0.25,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/Rectangle 3.png'),
//                   fit: BoxFit.fill,
//                 ),
//                 borderRadius: BorderRadius.circular(50),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

