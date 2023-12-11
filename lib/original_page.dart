// ignore_for_file: library_private_types_in_public_api, use_full_hex_values_for_flutter_colors, use_build_context_synchronously, avoid_print, prefer_const_declarations, override_on_non_overriding_member

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:new_zen_up/constant.dart';
import 'package:new_zen_up/home_page.dart';
import 'package:new_zen_up/play_audio.dart';
import 'package:http/http.dart' as http;
import 'package:new_zen_up/profile_page.dart';
import 'package:new_zen_up/random_audio.dart';
import 'package:new_zen_up/shareed_preferences.dart';

String userName = 'Name';
String? fetchedpreviousAudio2;

class OriginalPage extends StatefulWidget {
  const OriginalPage({super.key});

  @override
  _OriginalPageState createState() => _OriginalPageState();
}

class _OriginalPageState extends State<OriginalPage> {
  String? fetchedpreviousAudio;
  Future<void> fetchPreviousAudio() async {
    try {
      final String apiUrl =
          'https://meditation-0gig.onrender.com/previous-audio';

      // Retrieve the access token from local storage
      final String? accessToken = await getTokenFromLocal();

      if (accessToken == null) {
        print(
            'Access token not found. Please log in.'); // Handle the case where the access token is not available
        // You might want to navigate to the login screen or take other actions here
        return;
      }

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        print("Done");
        // Check if the response body is not null
        final Map<String, dynamic> previousAudioList =
            json.decode(response.body);
        print(previousAudioList);
        fetchedpreviousAudio = previousAudioList['mixedAudioPath'];
        print(fetchedpreviousAudio);
        fetchedpreviousAudio2 =
            'https://meditation-0gig.onrender.com$fetchedpreviousAudio';
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AudioPlayerApp(
              finalMergedAudio: fetchedpreviousAudio2!,
              listOfAudios: const [],
            ),
          ),
        );
      } else {
        print(
            'Failed to fetch previous audio. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        // Handle failure, you can check response.body for more details
      }
    } catch (error) {
      print('Error occurred during previous audio fetch: $error');
      // Handle other errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              Image.asset(
                'assets/editHome.png',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.45,
              ),
              // Images and Text Column
              Positioned(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.06,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.04),
                          child: const CircleImageCard(
                            imagePath: 'assets/1 (1).png',
                            title: 'Awareness',
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        const CircleImageCard(
                          imagePath: 'assets/10.png',
                          title: 'Breathing',
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        const CircleImageCard(
                          imagePath: 'assets/3-2.png',
                          title: 'Compassion',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.05,
                              left: MediaQuery.of(context).size.width * 0.03),
                          child: const CircleImageCard(
                            imagePath: 'assets/9.png',
                            title: 'Forgiveness',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.08),
                          child: const CircleImageCard(
                            imagePath: 'assets/8.png',
                            title: 'Gratitude',
                          ),
                        ),
                        const CircleImageCard(
                          imagePath: 'assets/7.png',
                          title: 'Happiness',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            GestureDetector(
              onTap: () {
                fetchPreviousAudio();
              },
              child: const ChooseButton(
                text: "Play previous",
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
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

class CircleImageCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const CircleImageCard({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 4.0,
            ),
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width * 0.19,
            height: MediaQuery.of(context).size.height * 0.07,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.05,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Future<void> fetchUserName() async {
    try {
      final String apiUrl =
          'https://meditation-0gig.onrender.com/auth/user-name';

      // Retrieve the access token from local storage
      final String? accessToken = await getTokenFromLocal();

      if (accessToken == null) {
        print('Access token not found.');
        // Handle the case where the access token is not available
        return;
      }

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        // Parse and use the response as needed
        final Map<String, dynamic> responseData = json.decode(response.body);
        String fetchedUserName = responseData['user'];
        print(fetchedUserName);
        setState(() {
          userName = fetchedUserName;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfilePage(),
            ),
          );
        });
      } else {
        print('Failed to fetch user name. Status code: ${response.statusCode}');
        // Handle failure, you can check response.body for more details
      }
    } catch (error) {
      print('Error occurred during user name fetch: $error');
      // Handle other errors
    }
  }

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
              fetchUserName();
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
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
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
