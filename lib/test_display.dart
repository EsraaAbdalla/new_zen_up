// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:new_zen_up/Cubit/audios_cat.dart';
// import 'package:new_zen_up/rec_name.dart';

// class AudioPage extends StatefulWidget {
//   @override
//   _AudioPageState createState() => _AudioPageState();
// }

// class _AudioPageState extends State<AudioPage> {
//   @override
//   void initState() {
//     super.initState();

//     // Access the AudioBloc using context.read
//     final audioBloc = context.read<AudioBloc>();

//     // Call getAudiosByCategory to fetch audio data
//     audioBloc.getAudiosByCategory('awareness');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Audio List'),
//       ),
//       body: BlocBuilder<AudioBloc, List<AudioData>>(
//         builder: (context, audioDataList) {
//           if (audioDataList.isEmpty) {
//             return Center(
//               child:
//                   CircularProgressIndicator(), // Display a loading indicator while fetching data.
//             );
//           } else {
//             return ListView.builder(
//               itemCount: audioDataList.length,
//               itemBuilder: (context, index) {
//                 final audioData = audioDataList[index];
//                 return RecordNum(
//                   color1: Colors.lightBlue, RecName: audioData.name,
//                   color2: Colors.blue, number: audioData.length.toString(),

//                   // You can add more UI components to display audio data as needed.
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
//##################################
// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, avoid_print, must_be_immutable, prefer_const_declarations, use_full_hex_values_for_flutter_colors

// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'dart:convert';
// import 'package:new_zen_up/rec_name.dart';

// class AudioListPage extends StatefulWidget {
//   final String RecName;
//   Color color1;
//   Color color2;

//   AudioListPage(
//       {super.key,
//       required this.RecName,
//       required this.color1,
//       required this.color2});
//   @override
//   _AudioListPageState createState() => _AudioListPageState();
// }

// class _AudioListPageState extends State<AudioListPage> {

//   AudioPlayer audioPlayer = AudioPlayer();
//   List<String> selectedAudios = [];

//   void playAudio(String audioPath) async {
//     await audioPlayer.play(UrlSource(audioPath));
//   }

//   Future<Map<String, dynamic>> fetchAudiosByCategory(
//       String categoryName) async {
//     final String baseUrl = 'https://meditation-0gig.onrender.com';
//     final response =
//         await http.get(Uri.parse('$baseUrl/getAudiosByCat/$categoryName'));
//     // final response = await http.get(
//     //     Uri.parse("https://meditation-0gig.onrender.com/getAudiosByCat/awareness"));

//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load data from the API');
//     }
//   }

//   IconData iconData = Icons.play_arrow; // Initial icon (play)
//   bool isPlaying = false;
//    int selectedAudioIndex = -1;
//   Future<void> toggleAudioPlayback() async {
//     if (isPlaying) {
//       await audioPlayer.pause();
//       setState(() {
//         isPlaying = false;
//         iconData = Icons.play_arrow; // Change the icon to play
//       });
//     } else {
//       // await audioPlayer.play();
//       setState(() {
//         isPlaying = true;
//         iconData = Icons.pause; // Change the icon to pause
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Load your audio URL here
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<Map<String, dynamic>>(
//         future: fetchAudiosByCategory(widget.RecName),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             final audioList = snapshot.data;
//             print(audioList!['Audios'][0]['path']);
//             print(snapshot);
//             return ListView.builder(
//               itemCount: audioList!['Audios'].length,
//               itemBuilder: (context, index) {
//                 final audio = audioList['Audios'][index];
//                 return Padding(
//                   padding:
//                       const EdgeInsets.only(bottom: 10, left: 20, right: 20),
//                   child: InkWell(
//                     // onTap: () {
//                     //   playAudio(audio['path']);
//                     // },
//                     child: RecordNum(
//                       RecName: audio['name'],
//                       color1: widget.color1,
//                       color2: widget.color2,
//                       number: audio['length'].toString(),
//                       onTapFunction: () {
//                         toggleAudioPlayback();
//                         playAudio(audioList['Audios'][index]['path']);
//                       },
//                       icon: Icon(
//                         iconData,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_zen_up/audio_ready.dart';
// import 'package:new_zen_up/cat_circle.dart';
import 'package:new_zen_up/home_page.dart';

import 'dart:convert';
import 'package:new_zen_up/rec_name.dart';

List<Map<String, dynamic>> selectedAudios = [];

class AudioListPage extends StatefulWidget {
  final String RecName;
  Color color1;
  Color color2;

  AudioListPage(
      {super.key,
      required this.RecName,
      required this.color1,
      required this.color2});
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

            // print(audioList!['Audios'][0]['path']);
            // print(snapshot);
            return ListView.builder(
              itemCount: audioList!['Audios'].length,
              itemBuilder: (context, index) {
                final audio = audioList['Audios'][index];
                final audioName = audio['name'];
                final audioDes = audio['description'];

                // Check if the current audio is selected
                final isSelected = selectedAudioIndex == index;

                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                  child: InkWell(
                    onTap: () {
                      bool userAlreadyChoseCategory = false;

                      // for (Item item in selectedAudios) {
                      //   if (item.catName == audio['categoryName']) {
                      //     userAlreadyChoseCategory = true;
                      //     break; // Exit the loop if a matching category is found
                      //   }
                      // }

                      // if (!userAlreadyChoseCategory) {
                      //   // If the user hasn't chosen an item from the same category, add the ID
                      //   selectedAudios
                      //       .add(Item(audio['_id'], audio['categoryName']));
                      //   for (Item item in selectedAudios) {
                      //     print(item.runtimeType);
                      //   }
                      // }

                      // for (Item item in selectedAudios) {
                      //   //  print("ID: ${item.id}, Category: ${item.catName}");
                      //   // print(item.id);
                      // }

                      ////////////////////////////////////////////////////////////////////
                      ///ADD 💖💖💖💖
                      if (selectedAudios.isEmpty) {
                        // If the list is empty, add the ID directly
                        selectedAudios
                            .add({"_id": audio['_id'], "name": audio['name']});
                        if (selectedAudios.length == 1) {
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
                        } else if (selectedAudios.length == 2) {
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
                        } else if (selectedAudios.length == 3) {
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
                        } else if (selectedAudios.length == 4) {
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
                        } else if (selectedAudios.length == 5) {
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
                          // If the ID is not in the list, add it
                          selectedAudios.add(
                              {"_id": audio['_id'], "name": audio['name']});
                          if (selectedAudios.length == 1) {
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
                          } else if (selectedAudios.length == 2) {
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
                          } else if (selectedAudios.length == 3) {
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
                          } else if (selectedAudios.length == 4) {
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
                          } else if (selectedAudios.length == 5) {
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
                      //////////////////////////////////////////////////////////////////
                      //.........................
                      // if (selectedAudios.isEmpty) {
                      //   print("list is empty");
                      //   audioIds().CatName = audio['name'];
                      //   audioIds().id = audio['_id'];
                      //   print(audioIds());
                      //   selectedAudios.add(audioIds());
                      // } else if (selectedAudios.length != 0) {
                      //   print("list is not empty");

                      //   for (int i = 0; i < selectedAudios.length; i++) {
                      //     if (audio['_id'] == selectedAudios[i]) {
                      //       print("list has same value");
                      //     } else {
                      //       print("done");
                      //       selectedAudios.add(audio['_id']);
                      //     }
                      //   }

                      //   // selectedAudios.clear();
                      //   // selectedAudios.add(audio['_id']);
                      // } else {
                      //   // selectedAudios.add(audio['_id']);
                      // }
                      // // selectedAudios.add(audio['_id']);
                      // print(selectedAudios);
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

  // Future<void> toggleAudioPlayback(int index) async {
  //             if (index == selectedAudioIndex) {
  //               if (isPlaying) {
  //                 await audioPlayer.pause();
  //                 setState(() {
  //                   isPlaying = false;
  //                   iconData = Icons.play_arrow;
  //                 });
  //               } else {
  //                 await audioPlayer.resume(); // Use resume to continue playing
  //                 setState(() {
  //                   isPlaying = true;
  //                   iconData = Icons.pause;
  //                 });
  //               }
  //             } else {
  //               // Play the selected audio
  //               playAudio(audioList!['Audios'][index]['path']);
  //               setState(() {
  //                 selectedAudioIndex = index;
  //                 isPlaying = true;
  //                 iconData = Icons.pause;
  //               });
  //             }
  //           }