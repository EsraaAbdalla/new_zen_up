// ignore_for_file: use_full_hex_values_for_flutter_colors, avoid_print

import 'package:flutter/material.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());

  void _submitCode() {
    String enteredCode =
        _controllers.map((controller) => controller.text).join();
    // You can handle the entered code here, e.g., validate it or send it to a server.
    print('Entered code: $enteredCode');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please Enter The Code',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 212, 211, 211),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    controller: _controllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    maxLength: 1,
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            TextButton(
              style: TextButton.styleFrom(
                  minimumSize: const Size(315, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        25), // Set the desired circular border radius
                  ),
                  backgroundColor: Color.lerp(
                      const Color(0XFFFCC8FED), const Color(0XFFF6B50F6), 0.5)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                _submitCode();
              },
            ),
          ],
        ),
      ),
    );
  }
}
