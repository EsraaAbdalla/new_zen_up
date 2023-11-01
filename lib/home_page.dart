// ignore_for_file: sized_box_for_whitespace, use_full_hex_values_for_flutter_colors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:new_zen_up/cat_circle.dart';
import 'package:new_zen_up/nav_bar.dart';
import 'package:new_zen_up/rec_name.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      required this.imageName,
      required this.CatName,
      required this.color1,
      required this.color2});
  final String imageName;
  final String CatName;
  final Color color1;
  final Color color2;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(45)),
                image: DecorationImage(
                    image: AssetImage(widget.imageName), fit: BoxFit.cover)),
            child: Center(
              child: Text(
                widget.CatName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          RecordNum(
            RecName: 'WAKE UP YOUR SENSES',
            number: '1',
            color1: widget.color1,
            color2: widget.color2,
          ),
          const SizedBox(
            height: 20,
          ),
          RecordNum(
            RecName: 'Breathing awareness',
            number: '2',
            color1: widget.color1,
            color2: widget.color2,
          ),
          const SizedBox(
            height: 20,
          ),
          RecordNum(
            RecName: 'Awareness of thoughts',
            number: '3',
            color1: widget.color1,
            color2: widget.color2,
          ),
          const SizedBox(
            height: 20,
          ),
          RecordNum(
            RecName: 'Sights and sounds',
            number: '4',
            color1: widget.color1,
            color2: widget.color2,
          ),
          const SizedBox(
            height: 20,
          ),
          RecordNum(
            RecName: 'Body scan',
            number: '5',
            color1: widget.color1,
            color2: widget.color2,
          ),
          const SizedBox(
            height: 15,
          ),
          HomeSkip(
            color: widget.color2,
          ),
          const SizedBox(
              height: 30), // Add spacing between HomeSkip and CatCircle
          Container(
            height: 100, // Set a specific height for the CatCircle widget
            child: const CatCircle(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          )
        ]),
      ),
    );
  }
}

class HomeSkip extends StatefulWidget {
  final Color color;
  const HomeSkip({
    super.key,
    required this.color,
  });

  @override
  State<HomeSkip> createState() => _HomeSkipState();
}

class _HomeSkipState extends State<HomeSkip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NavBar()),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 15),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFFF166FFF),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Home',
                      style: TextStyle(
                          color: Color(0xFFF166FFF),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Row(
                children: const [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 5),
                      child: Text(
                        'Skip A',
                        style: TextStyle(
                            color: Color(0xFFF166FFF),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFFF166FFF),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
