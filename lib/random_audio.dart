// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_declarations, avoid_print, prefer_final_fields, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_zen_up/audio_ready.dart';

import 'package:http/http.dart' as http;
import 'package:new_zen_up/original_page.dart';

Future<List<Map<String, dynamic>>> getRandomAudios(String minutes) async {
  final String apiUrl =
      'https://meditation-0gig.onrender.com/get-random-audios';
  final Map<String, String> headers = {'Content-Type': 'application/json'};
  final Map<String, dynamic> body = {'minutes': minutes};

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // Successfully fetched data, parse and return the result
      List<dynamic> data = jsonDecode(response.body);
      List<Map<String, dynamic>> audioList = List<Map<String, dynamic>>.from(
        data.map((item) => Map<String, dynamic>.from(item)),
      );
      return audioList;
    } else {
      // Handle errors, e.g., throw an exception or return an empty list
      print('Error: ${response.statusCode}');
      return [];
    }
  } catch (error) {
    // Handle other errors, e.g., throw an exception or return an empty list
    print('Error: $error');
    return [];
  }
}

class RandomAudio extends StatefulWidget {
  const RandomAudio({super.key});

  @override
  State<RandomAudio> createState() => _RandomAudioState();
}

class _RandomAudioState extends State<RandomAudio> {
  TextEditingController _minutesController = TextEditingController();

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
                    'Enter number from 6-30 min ',
                    style: TextStyle(
                      color: Color(0XFFFADA4A5),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: TextField(
                controller: _minutesController,
                keyboardType: TextInputType.number,
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
                  boxShadow: const [
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
                  onPressed: () async {
                    String minutes = _minutesController.text;
                    print(
                        minutes); // Change this to the desired number of minutes
                    List<Map<String, dynamic>> result =
                        await getRandomAudios(minutes);
                    if (result.isNotEmpty) {
                      // Handle the result, for example, navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioReady(
                            listOfAudios: result,
                          ),
                        ),
                      );
                    } else {
                      // Handle the case when the result is empty or an error occurred
                      print('Error or empty result');
                    }
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
                        builder: (context) => const OriginalPage(),
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
