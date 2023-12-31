// ignore_for_file: sized_box_for_whitespace, use_full_hex_values_for_flutter_colors, non_constant_identifier_names, use_build_context_synchronously, avoid_print

// import 'dart:ffi';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:new_zen_up/audio_ready.dart';
import 'package:new_zen_up/cat_circle.dart';
import 'package:new_zen_up/original_page.dart';
import 'package:new_zen_up/test_display.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.imageName,
    required this.CatName,
    required this.color1,
    required this.color2,
    required this.CatChar,
  });
  final String imageName;
  final String CatName;
  final Color color1;
  final Color color2;
  final String CatChar;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
  }

  Future<void> showCategoryDialog(String categoryName) async {
    final apiUrl =
        'https://meditation-0gig.onrender.com/getAudiosByCat/$categoryName';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        // print(data);
        String categoryDesc =
            data['categoryDesc'] ?? 'No description available';

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Category Description'),
            content: Text(categoryDesc),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      } else {
        // Handle error cases if needed
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions if needed
      print('Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(45)),
              image: DecorationImage(
                  image: AssetImage(widget.imageName), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: GestureDetector(
                  onTap: () {
                    showCategoryDialog(widget.CatName.toLowerCase());
                  },
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  widget.CatName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Expanded(
            flex: 3,
            child: AudioListPage(
              RecName: widget.CatName.toLowerCase(),
              color1: widget.color1,
              color2: widget.color2,
              CatName: widget.CatName,
            )),
        HomeSkip(
          color: widget.color2,
          catChar: widget.CatChar,
          CatName: widget.CatName,
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height *
                0.01), // Add spacing between HomeSkip and CatCircle
        Container(
          height: MediaQuery.of(context).size.height *
              0.1, // Set a specific height for the CatCircle widget
          child: CatCircle(CatName: widget.CatName),
        ),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.02,
        // )
      ]),
    );
  }
}

class HomeSkip extends StatefulWidget {
  final String catChar;
  final Color color;
  final String CatName;
  const HomeSkip({
    super.key,
    required this.color,
    required this.catChar,
    required this.CatName,
  });

  @override
  State<HomeSkip> createState() => _HomeSkipState();
}

class _HomeSkipState extends State<HomeSkip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              selectedAudios.clear();

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OriginalPage()),
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.02),
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
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07),
            child: GestureDetector(
              onTap: () {
                if (widget.catChar == 'A' && widget.CatName == 'Awareness') {
                  selectedAudios.add({
                    'categoryName': widget.CatName,
                    'name': 'Skipped',
                    'length': 0
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(
                        CatName: 'Breathing',
                        imageName: 'assets/Group 3161.png',
                        color1: Color(0xFFF0DCA91),
                        color2: Color(0xFFF0DCA91),
                        CatChar: 'B',
                      ),
                    ),
                  );
                } else if (widget.catChar == 'B' &&
                    widget.CatName == 'Breathing') {
                  selectedAudios.add({
                    'categoryName': widget.CatName,
                    'name': 'Skipped',
                    'length': 0
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(
                          CatName: 'Compassion',
                          imageName: 'assets/Group 3162.png',
                          color1: Color(0xFFFFFD541),
                          color2: Color(0xFFFFFD541),
                          CatChar: 'C',
                        ),
                      ));
                } else if (widget.catChar == 'C' &&
                    widget.CatName == 'Compassion') {
                  selectedAudios.add({
                    'categoryName': widget.CatName,
                    'name': 'Skipped',
                    'length': 0
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(
                          CatName: 'Forgiveness',
                          imageName: 'assets/Group 3163.png',
                          color1: Color(0xFFFFB6F20),
                          color2: Color(0xFFFFB6F20),
                          CatChar: 'F',
                        ),
                      ));
                } else if (widget.catChar == 'F' &&
                    widget.CatName == 'Forgiveness') {
                  selectedAudios.add({
                    'categoryName': widget.CatName,
                    'name': 'Skipped',
                    'length': 0
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(
                          CatName: 'Gratitude',
                          imageName: 'assets/Group 3164.png',
                          color1: Color(0xFFF441DFC),
                          color2: Color(0xFFF441DFC),
                          CatChar: 'G',
                        ),
                      ));
                } else if (widget.catChar == 'G' &&
                    widget.CatName == 'Gratitude') {
                  selectedAudios.add({
                    'categoryName': widget.CatName,
                    'name': 'Skipped',
                    'length': 0
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(
                          CatName: 'Happiness',
                          imageName: 'assets/Group 3165.png',
                          color1: Color(0xFFF9D86FF),
                          color2: Color(0xFFF9D86FF),
                          CatChar: 'H',
                        ),
                      ));
                } else if (widget.catChar == 'H' &&
                    widget.CatName == 'Happiness') {
                  selectedAudios.add({
                    'categoryName': widget.CatName,
                    'name': 'Skipped',
                    'length': 0
                  });
                  if (selectedAudios.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content:
                            const Text('You Must Select at Least One Audio'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AudioReady(
                                  listOfAudios: selectedAudios,
                                )));
                  }
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Row(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.07,
                        ),
                        child: Text(
                          'Skip ${widget.catChar}',
                          style: TextStyle(
                              color: Color(0xFFF166FFF),
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.07,
                          left: MediaQuery.of(context).size.width * 0.02),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFFF166FFF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
