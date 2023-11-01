// ignore_for_file: must_be_immutable, non_constant_identifier_names, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class RecordNum extends StatelessWidget {
  final String RecName;
  final String number;
  Color color1;
  Color color2;

  RecordNum({
    super.key,
    required this.RecName,
    required this.number,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color1.withOpacity(0.2),
      ),
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
            child: Container(
              width: 51,
              height: 51,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color2.withOpacity(0.3)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(children: [
                    Text(number,
                        style: const TextStyle(
                            color: Color(0xFFF166FFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    const Text(
                      'min',
                      style: TextStyle(color: Color(0xFFF166FFF), fontSize: 14),
                    ),
                  ]),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.06),
            child: Text(
              RecName,
              style: const TextStyle(
                  color: Color(0xFFF166FFF),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
