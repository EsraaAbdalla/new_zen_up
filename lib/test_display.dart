import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_zen_up/accordion_page.dart';
import 'package:new_zen_up/audio_ready.dart';
import 'package:new_zen_up/home_page.dart';
import 'dart:convert';
import 'package:new_zen_up/rec_name.dart';

List<Map<String, dynamic>> selectedAudios = [];

class AudioListPage extends StatefulWidget {
  final String RecName;
  final String CatName;
  Color color1;
  Color color2;

  AudioListPage(
      {super.key,
      required this.RecName,
      required this.color1,
      required this.color2,
      required this.CatName});
  @override
  _AudioListPageState createState() => _AudioListPageState();
}

class _AudioListPageState extends State<AudioListPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  // List to store selected audio names

  void playAudio(String audioPath) async {
    await audioPlayer.play(UrlSource(audioPath));
  }

  Future<Map<String, dynamic>> fetchAudiosByCategory(
      String categoryName) async {
    final String baseUrl = 'https://meditation-0gig.onrender.com';
    final response =
        await http.get(Uri.parse('$baseUrl/getAudiosByCat/$categoryName'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data from the API');
    }
  }

  IconData iconData = Icons.play_arrow; // Initial icon (play)
  bool isPlaying = false;
  int selectedAudioIndex = -1; // Index of the selected audio

  @override
  void initState() {
    super.initState();
    // Load your audio URL here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchAudiosByCategory(widget.RecName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final audioList = snapshot.data;
            Future<void> toggleAudioPlayback(int index) async {
              if (index == selectedAudioIndex) {
                if (isPlaying) {
                  await audioPlayer.pause();
                  setState(() {
                    isPlaying = false;
                    iconData = Icons.play_arrow;
                  });
                } else {
                  await audioPlayer.resume(); // Use resume to continue playing
                  setState(() {
                    isPlaying = true;
                    iconData = Icons.pause;
                  });
                }
              } else {
                // Play the selected audio
                playAudio(audioList!['Audios'][index]['path']);
                setState(() {
                  selectedAudioIndex = index;
                  isPlaying = true;
                  iconData = Icons.pause;
                });
              }
            }

            return ListView.builder(
              itemCount: audioList!['Audios'].length,
              itemBuilder: (context, index) {
                final audio = audioList['Audios'][index];
                final audioName = audio['name'];
                final audioDes = audio['description'];
                // final length = audio['length'];

                // Check if the current audio is selected
                final isSelected = selectedAudioIndex == index;

                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        // selectedRows[categoryName] = value as int?;
                        YourObject newCategoryObject = YourObject(
                          categoryName: audio['categoryName'],
                          id: audio['_id'],
                          AudioName: audioName,
                          mint: audio['length'],
                        );
                        updatedList = updateListWithCategory(
                          newCategoryObject,
                          selectedAudios,
                        );
                      });
                      ////////////////////////////////////////////////////////////////////
                      ///ADD 💖💖💖💖
                      if (selectedAudios.isEmpty) {
                        print(selectedAudios);
                        if (widget.CatName == 'Awareness') {
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
                              ));
                        } else if (widget.CatName == 'Breathing') {
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
                        } else if (widget.CatName == 'Compassion') {
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
                        } else if (widget.CatName == 'Forgiveness') {
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
                        } else if (widget.CatName == 'Gratitude') {
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
                        }
                      } else {
                        // If the list is not empty, check if the ID is already in the list
                        bool idExists = false;
                        for (Object item in selectedAudios) {
                          if (item == audio['_id']) {
                            idExists = true;
                            break; // Exit the loop if the ID is found
                          }
                        }
                        if (!idExists) {
                          if (widget.CatName == 'Awareness') {
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
                                ));
                          } else if (widget.CatName == 'Breathing') {
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
                          } else if (widget.CatName == 'Compassion') {
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
                          } else if (widget.CatName == 'Forgiveness') {
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
                          } else if (widget.CatName == 'Gratitude') {
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
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AudioReady(
                                    listOfAudios: selectedAudios,
                                  ),
                                ));
                          }
                        }
                      }
                      print(selectedAudios);
                      //💖💖💖💖💖💖💖💖💖💖
                    },
                    child: RecordNum(
                      RecName: audioName,
                      color1: widget.color1,
                      color2: widget.color2,
                      number: audio['length'].toString(),
                      onTapFunction: () {
                        toggleAudioPlayback(index);
                      },
                      icon: Icon(
                        isSelected ? iconData : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      Des: audioDes,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Item {
  String id;
  String catName;

  Item(this.id, this.catName);
}

class audioIds {
  late String CatName;
  late String id;
}

class SelectedAudio {
  String categoryName;
  String audioId;

  SelectedAudio({required this.categoryName, required this.audioId});
}
