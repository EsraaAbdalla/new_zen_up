// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:new_zen_up/nav_bar.dart';
import 'package:new_zen_up/original_page.dart';

class RandomAudio extends StatelessWidget {
  const RandomAudio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/random.png', // Replace with your image URL
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top:
                      111, // Adjust this value to change the vertical position of the title
                  child: Column(
                    children: const [
                      Text(
                        'Don\'t know what to choose ?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Relax, and let us choose for you',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Row(
                children: const [
                  Text(
                    'Enter number from 1-30 min ',
                    style: TextStyle(
                      color: Color(0XFFFADA4A5),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '(!No decimal)',
                    style: TextStyle(
                      color: Color(0XFFFFF0000),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 245, 245, 245),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(14)),
                  labelText: 'Audio Length',
                  labelStyle: const TextStyle(
                    color: Color(0xFFFADA4A5),
                  ),
                  prefixIcon:
                      const Icon(Icons.audiotrack, color: Color(0xFFFADA4A5)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 23, right: 23, top: 50, bottom: 6),
              child: Ink(
                //  width: ,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  color: Colors.purpleAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(
                          255, 214, 206, 206), // Color of the shadow
                      offset: Offset(0, 3), // Offset of the shadow (x, y)
                      blurRadius: 5, // Spread of the shadow
                      // spreadRadius: 0, // Optional: Additional spread radius
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
                          'Mix',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 17,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 23, right: 23, top: 6, bottom: 33),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavBar(),
                      ),
                    );
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
                          'Back to home',
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
            ),
          ],
        ),
      ),
    );
  }
}
