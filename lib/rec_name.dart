// ignore_for_file: non_constant_identifier_names, use_full_hex_values_for_flutter_colors, must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RecordNum extends StatefulWidget {
  final String RecName;
  final String Des;
  final String number;
  Color color1;
  Color color2;
  final VoidCallback onTapFunction;
  final Icon icon;

  RecordNum({
    Key? key,
    required this.RecName,
    required this.number,
    required this.color1,
    required this.color2,
    required this.onTapFunction,
    required this.icon,
    required this.Des,
  }) : super(key: key);

  @override
  State<RecordNum> createState() => _RecordNumState();
}

class _RecordNumState extends State<RecordNum> {
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.color1.withOpacity(0.2),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 10,
              right: 20,
            ),
            child: Container(
              width: 51,
              height: 51,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: widget.color2.withOpacity(0.3),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Text(
                        widget.number,
                        style: const TextStyle(
                          color: Color(0xFFF166FFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const Text(
                        'min',
                        style: TextStyle(
                          color: Color(0xFFF166FFF),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6),
              child: Text(
                widget.RecName,
                style: const TextStyle(
                  color: Color(0xFFF166FFF),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                softWrap: true, // Enable text wrapping
              ),
            ),
          ),
          IconButton(
            icon: widget.icon,
            onPressed: () {
              widget.onTapFunction(); // Call the provided function
            },
          ),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: AlertDialog(
                      title: const Text('Audio Description'),
                      content: Text(widget.Des),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.question_mark_rounded,
                color: Colors.white,
                size: 20,
              ))
        ],
      ),
    );
  }
}
