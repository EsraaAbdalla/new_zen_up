// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class AudioReady extends StatelessWidget {
  final List<String> dataList = [
    '1-Wake Up Now',
    '2-This Time Up',
    '3-Let’s Start',
    '4-Welcome Back',
    '5-Relax',
    '6-Now Or Never',
  ];

  AudioReady({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Image.asset(
          'assets/Frame.png',
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 30),
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Your Audio Is Ready",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: dataList.map((item) {
            return Column(
              children: [
                ListTile(
                  title: Text(
                    item,
                    style: const TextStyle(color: Color(0XFFFB6B4C2)),
                  ),
                ),
                //  SizedBox(height: 1),
              ],
            );
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Ink(
            //  width: ,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 3),
                  blurRadius: 5,
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                // Add your button action here
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Play Now',
                      style: TextStyle(
                          color: Colors.purpleAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.purpleAccent,
                      size: 17,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 5),
          child: Ink(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 3),
                  blurRadius: 5,
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                // Add your button action here
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.purpleAccent,
                      size: 17,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Edit List',
                      style: TextStyle(
                          color: Colors.purpleAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
