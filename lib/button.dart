// ignore_for_file: use_full_hex_values_for_flutter_colors, must_be_immutable

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  void Function() onPressed;
  Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        style: TextButton.styleFrom(
            minimumSize: const Size(315, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  25), // Set the desired circular border radius
            ),
            backgroundColor: Color.lerp(
                const Color(0XFFFCC8FED), const Color(0XFFF6B50F6), 0.5)),
        onPressed: onPressed,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
