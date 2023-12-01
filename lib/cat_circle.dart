// ignore_for_file: use_full_hex_values_for_flutter_colors, non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:new_zen_up/home_page.dart';

class CatCircle extends StatefulWidget {
  final String CatName;
  const CatCircle({
    Key? key,
    required this.CatName,
  }) : super(key: key);

  @override
  _CatCircleState createState() => _CatCircleState();
}

class _CatCircleState extends State<CatCircle> {
  final List<Color> circleColors = [
    const Color(0xFFFFF3F3F), // Default color for A
    const Color(0xFFF0DCA91), // Default color for B
    const Color(0xFFFFFD541), // Default color for C
    const Color(0xFFFFB6F20), // Default color for F
    const Color(0xFFF441DFC), // Default color for G
    const Color(0xFFF9D86FF), // Default color for H
  ];

  final List<CircleData> circles = [
    CircleData(
      character: 'A',
      page: const HomePage(
        CatName: 'Awareness',
        imageName: 'assets/Group 3160.png',
        color1: Color(0xFFFFF3F3F), // Special color for Awareness A
        color2: Color(0xFFFFF3F3F),
        CatChar: 'A',
      ),
      color: const Color(0xFFFFF3F3F),
    ),
    CircleData(
      character: 'B',
      page: const HomePage(
        CatName: 'Breathing',
        imageName: 'assets/Group 3161.png',
        color1: Color(0xFFF0DCA91),
        color2: Color(0xFFF0DCA91), // Special color for Breathing B
        CatChar: 'B',
      ),
      color: const Color(0xFFF0DCA91),
    ),
    CircleData(
      character: 'C',
      page: const HomePage(
        CatName: 'Compassion',
        imageName: 'assets/Group 3162.png',
        color1: Color(0xFFFFFD541),
        color2: Color(0xFFFFFD541),
        CatChar: 'C',
      ),
      color: const Color(0xFFFFFD541),
    ),
    CircleData(
      character: 'F',
      page: const HomePage(
        CatName: 'Forgiveness',
        imageName: 'assets/Group 3163.png',
        color1: Color(0xFFFFB6F20),
        color2: Color(0xFFFFB6F20),
        CatChar: 'F',
      ),
      color: const Color(0xFFFFB6F20),
    ),
    CircleData(
      character: 'G',
      page: const HomePage(
        CatName: 'Gratitude',
        imageName: 'assets/Group 3164.png',
        color1: Color(0xFFF441DFC),
        color2: Color(0xFFF441DFC),
        CatChar: 'G',
      ),
      color: const Color(0xFFF441DFC),
    ),
    CircleData(
      character: 'H',
      page: const HomePage(
        CatName: 'Happiness',
        imageName: 'assets/Group 3165.png',
        color1: Color(0xFFF9D86FF),
        color2: Color(0xFFF9D86FF),
        CatChar: 'H',
      ),
      color: const Color(0xFFF9D86FF),
    ),
  ];

  int selectedCircleIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: CirclePainter(circles.length, selectedCircleIndex),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: circles.asMap().entries.map((entry) {
            final index = entry.key;
            final circle = entry.value;
            bool isSelected = false;

            if (widget.CatName == 'Awareness' && index == 0) {
              isSelected = true;
            } else if (widget.CatName == 'Breathing' && index <= 1) {
              isSelected = true;
            } else if (widget.CatName == 'Compassion' && index <= 2) {
              isSelected = true;
            } else if (widget.CatName == 'Forgiveness' && index <= 3) {
              isSelected = true;
            } else if (widget.CatName == 'Gratitude' && index <= 4) {
              isSelected = true;
            } else if (widget.CatName == 'Happiness' && index <= 5) {
              isSelected = true;
            }
            bool isClickable =
                isSelected && index < 1; // Make A clickable when in B
// or use: bool isClickable = isSelected && index < 1; // Make A clickable when in B

            if (widget.CatName == 'Compassion' && index < 2) {
              isClickable = isSelected; // Make A and B clickable when in C
            } else if (widget.CatName == 'Forgiveness' && index < 3) {
              isClickable = isSelected; // Make A, B, and C clickable when in F
            } else if (widget.CatName == 'Gratitude' && index < 4) {
              isClickable =
                  isSelected; // Make A, B, C and F clickable when in G
            } else if (widget.CatName == 'Happiness' && index < 5) {
              isClickable =
                  isSelected; // Make A, B, C and F clickable when in G
            }

// Add similar conditions for other categories as needed

            return GestureDetector(
              onTap: isClickable
                  ? () {
                      // Add your onTap logic here
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage(
                                    CatName: 'Awareness',
                                    imageName: 'assets/Group 3160.png',
                                    color1: Color(
                                        0xFFFFF3F3F), // Special color for Awareness A
                                    color2: Color(0xFFFFF3F3F),
                                    CatChar: 'A',
                                  )),
                        );
                      } else if (index == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage(
                                      CatName: 'Breathing',
                                      imageName: 'assets/Group 3161.png',
                                      color1: Color(0xFFF0DCA91),
                                      color2: Color(
                                          0xFFF0DCA91), // Special color for Breathing B
                                      CatChar: 'B',
                                    )));
                      } else if (index == 2) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage(
                                      CatName: 'Compassion',
                                      imageName: 'assets/Group 3162.png',
                                      color1: Color(0xFFFFFD541),
                                      color2: Color(0xFFFFFD541),
                                      CatChar: 'C',
                                    )));
                      } else if (index == 3) {
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
                      } else if (index == 4) {
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
                      } else if (index == 5) {
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
                    }
                  : null,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? (index == 0 && widget.CatName == 'Awareness')
                          ? circleColors[0] // Special color for Awareness A
                          : (index == 1 && widget.CatName == 'Breathing')
                              ? circleColors[1] // Special color for Breathing B
                              : (index == 2 && widget.CatName == 'Compassion')
                                  ? circleColors[2]
                                  : (index == 3 &&
                                          widget.CatName == 'Forgiveness')
                                      ? circleColors[3]
                                      : (index == 4 &&
                                              widget.CatName == 'Gratitude')
                                          ? circleColors[4]
                                          : (index == 5 &&
                                                  widget.CatName == 'Happiness')
                                              ? circleColors[
                                                  5] // Special color for Compassion C
                                              : Colors
                                                  .green // Default color for other selected circles
                      : const Color.fromARGB(255, 221, 219, 219),
                  border: Border.all(
                    color: isSelected ? Colors.white : const Color(0xFFF166FFF),
                    width: isSelected ? 2.0 : 0.0,
                  ),
                ),
                width: 50,
                height: 50,
                child: Center(
                  child: Text(
                    circle.character,
                    style: TextStyle(
                      fontSize: 22,
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final int circleCount;
  final int selectedCircleIndex;
  final Paint linePaint;

  CirclePainter(this.circleCount, this.selectedCircleIndex)
      : linePaint = Paint()
          ..color = const Color(0xFFFD5D5D5)
          ..strokeWidth = 9.0
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    final circleRadius = size.width / (circleCount * 2);
    final centerOffset = circleRadius;

    for (var i = 0; i < circleCount - 1; i++) {
      final startX = (i * 2 + 1) * centerOffset;
      final endX = ((i + 1) * 2 + 1) * centerOffset;
      final startY = size.height / 2;
      final endY = size.height / 2;

      final start = Offset(startX, startY);
      final end = Offset(endX, endY);

      canvas.drawLine(start, end, linePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CircleData {
  final String character;
  final Widget page;
  Color color;

  CircleData(
      {required this.character, required this.page, required this.color});
}
