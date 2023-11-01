// ignore_for_file: use_full_hex_values_for_flutter_colors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:new_zen_up/home_page.dart';

class CatCircle extends StatefulWidget {
  const CatCircle({
    Key? key,
  }) : super(key: key);

  @override
  _CatCircleState createState() => _CatCircleState();
}

class _CatCircleState extends State<CatCircle> {
  final List<CircleData> circles = [
    CircleData(
      character: 'A',
      page: const HomePage(
        CatName: 'Awareness',
        imageName: 'assets/Group 3160.png',
        color1: Color(0xFFFFF3F3F),
        color2: Color(0xFFFFF3F3F),
      ),
      color: const Color(0xFFFFFD9D9),
    ),
    CircleData(
      character: 'B',
      page: const HomePage(
        CatName: 'Breathing',
        imageName: 'assets/Group 3161.png',
        color1: Color(0xFFF0DCA91),
        color2: Color(0xFFF0DCA91),
      ),
      color: const Color(0xFFFCFF4E9),
    ),
    CircleData(
      character: 'C',
      page: const HomePage(
        CatName: 'Compassion',
        imageName: 'assets/Group 3162.png',
        color1: Color(0xFFFFFD541),
        color2: Color(0xFFFFFD541),
      ),
      color: const Color(0xFFFFFF7D9),
    ),
    CircleData(
      character: 'F',
      page: const HomePage(
        CatName: 'Forgiveness',
        imageName: 'assets/Group 3163.png',
        color1: Color(0xFFFFB6F20),
        color2: Color(0xFFFFB6F20),
      ),
      color: const Color(0xFFFFEE2D2),
    ),
    CircleData(
      character: 'G',
      page: const HomePage(
        CatName: 'Gratitude',
        imageName: 'assets/Group 3164.png',
        color1: Color(0xFFF441DFC),
        color2: Color(0xFFF441DFC),
      ),
      color: const Color(0xFFFDAD2FE),
    ),
    CircleData(
      character: 'H',
      page: const HomePage(
        CatName: 'Happiness',
        imageName: 'assets/Group 3165.png',
        color1: Color(0xFFF9D86FF),
        color2: Color(0xFFF9D86FF),
      ),
      color: const Color(0xFFFEBE7FF),
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
            final isSelected = index == selectedCircleIndex;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedCircleIndex = index;
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => circle.page),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? circle.color : const Color(0xFFFD5D5D5),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFFF166FFF)
                        : const Color(0xFFF166FFF),
                    // Change border color
                    width: isSelected ? 2.0 : 0.0, // Change border width
                  ),
                ),
                width: 50,
                height: 50,
                child: Center(
                  child: Text(
                    circle.character,
                    style: TextStyle(
                      fontSize: 22,
                      color: isSelected
                          ? const Color(0xFFF166FFF)
                          : Colors
                              .black, // Change character color Color(0xFFF166FFF),
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
  final Color color;

  CircleData(
      {required this.character, required this.page, required this.color});
}
