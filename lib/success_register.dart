// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:new_zen_up/nav_bar.dart';
import 'package:new_zen_up/original_page.dart';

class SuccessRegister extends StatelessWidget {
  const SuccessRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Success.png'),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Welcome, Stefani",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "You are all set now, let’s reach your",
              style: TextStyle(fontSize: 14, color: Color(0XFFF7B6F72)),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                " goals together with us",
                style: TextStyle(fontSize: 14, color: Color(0XFFF7B6F72)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 30,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                    minimumSize: const Size(315, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          25), // Set the desired circular border radius
                    ),
                    backgroundColor: Color.lerp(const Color(0XFFFCC8FED),
                        const Color(0XFFF6B50F6), 0.5)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Go To Home',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OriginalPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
