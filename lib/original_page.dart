// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:new_zen_up/home_page.dart';
import 'package:new_zen_up/random_audio.dart';

class OriginalPage extends StatelessWidget {
  const OriginalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 9,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/Rectangle 2.png',
                        ),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Awareness',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(
                        'Breathing',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(
                        'Compassion',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 9,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/Rectangle 3.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        'Forgiveness',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(
                        'Gratitude',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Happiness',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                        ),
                      ),
                    ],
                  ),
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
                              )),
                    );
                  },
                  child: const ChooseButton(
                    text: "Program your own personalized meditation",
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const ChooseButton(
                    text: "Play previous program",
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
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
                    text: "Choose by number of minutes",
                  ),
                ),
              ],
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
                  fontSize: 20,
                ),
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

