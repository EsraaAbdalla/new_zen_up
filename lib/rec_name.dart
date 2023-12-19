// ignore_for_file: non_constant_identifier_names, use_full_hex_values_for_flutter_colors, must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RecordNum extends StatefulWidget {
  final String RecName;
  final String Des;
  final String number;
  Color color1;
  Color color2;
  final VoidCallback onTapFunction;
  final Icon icon;

  RecordNum({
    Key? key,
    required this.RecName,
    required this.number,
    required this.color1,
    required this.color2,
    required this.onTapFunction,
    required this.icon,
    required this.Des,
  }) : super(key: key);

  @override
  State<RecordNum> createState() => _RecordNumState();
}

class _RecordNumState extends State<RecordNum> {
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: screenWidth > 750 ? screenHeight * 0.1 : screenWidth * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.color1.withOpacity(0.2),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 10,
              right: 20,
            ),
            child: Container(
              width:
                  screenWidth > 600 ? screenHeight * 0.2 : screenWidth * 0.25,
              height: screenHeight > 600
                  ? screenHeight * 0.41
                  : screenHeight * 0.29,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: widget.color2.withOpacity(0.3),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.number,
                        style: TextStyle(
                          color: Color(0xFFF166FFF),
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth > 600
                              ? screenHeight * 0.03
                              : screenWidth * 0.04,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Text(
                        'min',
                        style: TextStyle(
                          color: Color(0xFFF166FFF),
                          fontSize: screenWidth > 600
                              ? screenHeight * 0.05
                              : screenWidth * 0.04,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6),
              child: Text(
                widget.RecName,
                style: TextStyle(
                  color: Color(0xFFF166FFF),
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                softWrap: true, // Enable text wrapping
              ),
            ),
          ),
          // IconButton(
          //   icon: widget.icon,
          //   onPressed: () {
          //     widget.onTapFunction(); // Call the provided function
          //   },
          // ),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: AlertDialog(
                      title: const Text('Audio Description'),
                      content: Text(widget.Des),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 25,
              ))
        ],
      ),
    );
  }
}






// class _RecordNumState extends State<RecordNum> {
//   AudioPlayer audioPlayer = AudioPlayer();

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Container(
//       width: screenWidth * 0.9,
//       height: screenWidth > 750 ? screenWidth * 0.13 : screenWidth * 0.15,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: widget.color1.withOpacity(0.2),
//       ),
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Container(
//               width: screenWidth > 600 ? screenWidth * 0.4 : screenWidth * 0.25,
//               height: screenHeight > 600 ? screenHeight * 0.4 : screenHeight * 0.29,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: widget.color2.withOpacity(0.3),
//               ),
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         widget.number,
//                         style: TextStyle(
//                           color: Color(0xFFF166FFF),
//                           fontWeight: FontWeight.bold,
//                           fontSize: screenWidth * 0.05,
//                         ),
//                       ),
//                       SizedBox(width: screenWidth * 0.01),
//                       Text(
//                         'min',
//                         style: TextStyle(
//                           color: Color(0xFFF166FFF),
//                           fontSize: screenWidth * 0.05,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               constraints: BoxConstraints(
//                   maxWidth: screenWidth > 600 ? screenWidth * 0.6 : double.infinity),
//               child: Text(
//                 widget.RecName,
//                 style: TextStyle(
//                   color: Color(0xFFF166FFF),
//                   fontSize: screenWidth * 0.04,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 maxLines: 2,
//                 softWrap: true,
//               ),
//             ),
//           ),
//           IconButton(
//             onPressed: widget.onTapFunction,
//             icon: widget.icon,
//           ),
//           IconButton(
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: const Text('Audio Description'),
//                   content: Text(widget.Des),
//                   actions: [
//                     TextButton(
//                       child: const Text('OK'),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             icon: const Icon(
//               Icons.info_outline,
//               color: Colors.white,
//               size: 25,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
