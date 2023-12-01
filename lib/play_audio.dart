// ignore_for_file: use_full_hex_values_for_flutter_colors, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:new_zen_up/original_page.dart';

class AudioPlayerApp extends StatefulWidget {
  final String finalMergedAudio;
  const AudioPlayerApp(
      {super.key, required this.finalMergedAudio, required this.listOfAudios});
  final List<Map<String, dynamic>> listOfAudios;

  @override
  _AudioPlayerAppState createState() => _AudioPlayerAppState();
}

class _AudioPlayerAppState extends State<AudioPlayerApp> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  final AudioPlayer audioPlayer = AudioPlayer();
  double _position = 0.0;
  double _duration = 1.0;

  @override
  void initState() {
    super.initState();
    // Load your audio URL here
    _loadAudio();
  }

  void _loadAudio() async {
    print(widget.finalMergedAudio);
    AudioSource source = AudioSource.uri(Uri.parse(widget.finalMergedAudio));
    await audioPlayer.setAudioSource(source);
    await audioPlayer.load();
    audioPlayer.durationStream.listen((duration) {
      setState(() {
        _duration = duration!.inSeconds.toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Group 10308.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                const Text(
                  'Night Island',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const Text(
                  'SLEEP MUSIC',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFFFE6E7F2),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.replay_10,
                        color: Color(0XFFFE6E7F2),
                        size: 45,
                      ),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.25),
                      child: StreamBuilder<PlayerState>(
                        stream: audioPlayer.playerStateStream,
                        builder: (context, snapshot) {
                          if (snapshot.data?.playing == true) {
                            return IconButton(
                              icon: const Icon(
                                Icons.pause_circle_filled_outlined,
                                color: Color(0XFFFE6E7F2),
                                size: 50,
                              ),
                              onPressed: () {
                                audioPlayer.pause();
                              },
                            );
                          } else {
                            return IconButton(
                              icon: const Icon(
                                Icons.play_circle_filled_outlined,
                                color: Color(0XFFFE6E7F2),
                                size: 50,
                              ),
                              onPressed: () {
                                audioPlayer.play();
                              },
                            );
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        icon: const Icon(
                          Icons.forward_10,
                          color: Color(0XFFFE6E7F2),
                          size: 45,
                        ),
                        onPressed: () {
                          // Implement your forward button logic here
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                StreamBuilder<Duration?>(
                  stream: audioPlayer.positionStream,
                  builder: (context, snapshot) {
                    final position = snapshot.data ?? Duration.zero;
                    _position = position.inSeconds.toDouble();
                    return Slider(
                      value: _position,
                      onChanged: (value) {
                        setState(() {
                          _position = value;
                        });
                        audioPlayer.seek(Duration(seconds: value.toInt()));
                      },
                      min: 0.0,
                      max: _duration,
                      inactiveColor: const Color(0XFFF47557E),
                      activeColor: const Color(0XFFFE6E7F2),
                      thumbColor: const Color(0XFFF8E97FD),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90, left: 15, right: 15),
                  child: Container(
                    height: 65,
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
                              'Go To Favorite List',
                              style: TextStyle(
                                  color: Colors.purpleAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Poppins'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.purpleAccent,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: Container(
                    height: 65,
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
                        if (widget.listOfAudios.isNotEmpty) {
                          widget.listOfAudios.clear();
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OriginalPage()),
                        );
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.purpleAccent,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Go To Home',
                              style: TextStyle(
                                  color: Colors.purpleAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
