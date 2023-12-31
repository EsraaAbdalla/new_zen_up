// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables, prefer_const_declarations, avoid_print, unnecessary_brace_in_string_interps, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:new_zen_up/accordion_page.dart';
import 'package:new_zen_up/play_audio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_zen_up/shareed_preferences.dart';

var id;
String? mergeAudio;

Future<String?> mergeAudios(List<dynamic> audioIds) async {
  String? accessToken = await getTokenFromLocal();

  final String apiUrl = 'https://meditation-0gig.onrender.com/mergeAudios';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${accessToken}'
  };
  final Map<String, dynamic> body = {'audioIds': audioIds};
  print(headers);
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // Successfully merged audio, parse and return the mixed audio path
      Map<String, dynamic> responseData = jsonDecode(response.body);
      return responseData['mixedAudioPath'];
    } else {
      // Handle errors, e.g., throw an exception or return null
      print('Error: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    // Handle other errors, e.g., throw an exception or return null
    print('Error: $error');
    return null;
  }
}

class AudioReady extends StatefulWidget {
  const AudioReady({Key? key, required this.listOfAudios}) : super(key: key);
  final List<Map<String, dynamic>> listOfAudios;

  @override
  State<AudioReady> createState() => _AudioReadyState();
}

class _AudioReadyState extends State<AudioReady> {
  static const List<String> categoryNames = [
    'awareness',
    'breathing',
    'compassion',
    'forgiveness',
    'gratitude',
    'happiness',
  ];
  @override
  Widget build(BuildContext context) {
    Color getColorFromCharacter(String character) {
      // Use a switch or if-else statements to map characters to colors
      switch (character.toUpperCase()) {
        case 'A':
          return const Color(0XFFFFF3B3B);
        case 'B':
          return const Color(0XFFF0DCA91);
        // Add more cases as needed
        case 'C':
          return const Color(0XFFFFFD541);
        case 'F':
          return const Color(0XFFFFB6F20);
        case 'G':
          return const Color(0XFFF441DFC);
        case 'H':
          return const Color(0XFFF9D86FF);

        default:
          return Colors.purpleAccent;
      }
    }

    print(widget.listOfAudios);

    List<dynamic> audioIds =
        widget.listOfAudios.map((item) => item['_id']).toList();
    print(audioIds);
    List<dynamic> audioName =
        widget.listOfAudios.map((item) => item['name']).toList();
    print(audioName);

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
          children: widget.listOfAudios.map((item) {
            final name = item["name"];
            final length = item["length"];
            id = item["_id"];
            final catName = item['categoryName'];
            final avatarBackgroundColor = getColorFromCharacter(catName![0]);
            return Column(
              children: [
                ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: avatarBackgroundColor,
                      child: Text(
                        catName?.substring(0, 1).toString().toUpperCase() ??
                            '', // Display the first character of categoryName
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      name ?? '',
                      style: TextStyle(
                          color: const Color(0XFFFB6B4C2),
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(
                      '${length.toString()} min',
                      style: TextStyle(
                        color: const Color(0XFFFB6B4C2),
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            );
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Ink(
            //  width: ,1
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
              onPressed: () async {
                // Assuming you have a list of audioIds, replace it with your actual audioIds
                // await mergeAudios(audioIds);
                // Call the mergeAudios function
                audioIds =
                    audioIds.where((element) => element != null).toList();

                String? mixedAudioPath = await mergeAudios(audioIds);
                print(mixedAudioPath);
                if (mixedAudioPath != null) {
                  mergeAudio =
                      'https://meditation-0gig.onrender.com${mixedAudioPath}';
                  // Successfully obtained mixed audio path, you can use it as needed

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AudioPlayerApp(
                              finalMergedAudio: mergeAudio!,
                              listOfAudios: widget.listOfAudios,
                            )),
                  );
                } else {
                  // Handle the case when the merging failed or an error occurred
                  print('Failed to merge audio.');
                }
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccordionPage(
                            selected: widget.listOfAudios,
                          )),
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

class MyApp extends StatelessWidget {
  final List<String> expectedCategories = ['A', 'B', 'C', 'F', 'G', 'H'];
  // final List<String> categoryTitles = ['Category 1', 'Category 2', 'Category 3', 'Category 4', 'Category 5', 'Category 6'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: expectedCategories.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(expectedCategories[index]),
              ),
              // title: Text(categoryTitles[index]),
              // Add more ListTile properties as needed
            );
          },
        ),
      ),
    );
  }
}
