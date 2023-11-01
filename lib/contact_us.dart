// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0XFFFC150F6),
                  size: 24,
                ),
              ),
            ),
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0XFFFF7F8F8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                labelText: 'Email',
                labelStyle: const TextStyle(color: Color(0xFFFADA4A5)),
                prefixIcon: const Icon(
                  Icons.mail,
                  color: Color(0XFFFADA4A5),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              maxLines: 3,
              controller: emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0XFFFF7F8F8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                labelText: 'Message',
                labelStyle: const TextStyle(color: Color(0xFFFADA4A5)),
                prefixIcon: const Icon(
                  Icons.message,
                  color: Color(0XFFFADA4A5),
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
                      'Send',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 40.0),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginPage()),
                // );
              },
              child: Text(
                "Cancel?",
                style: TextStyle(
                    fontSize: 14,
                    color: Color.lerp(const Color(0XFFFC150F6),
                        const Color(0XFFFEEA4CE), 0.5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
