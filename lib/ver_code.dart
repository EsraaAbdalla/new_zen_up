// ignore_for_file: use_full_hex_values_for_flutter_colors, avoid_print, non_constant_identifier_names, prefer_const_declarations, unused_local_variable, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_zen_up/create_new_pass.dart';

String? token1;
String? Code;

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());

  String _submitCode() {
    String enteredCode =
        _controllers.map((controller) => controller.text).join();
    // You can handle the entered code here, e.g., validate it or send it to a server.
    return enteredCode;
  }

  Future<void> verifyResetToken(String resetToken) async {
    try {
      final String apiUrl =
          'https://meditation-0gig.onrender.com/api/password/reset/verify';

      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode({'resetToken': resetToken}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('Reset token verified successfully');
        // String responseBody = response.body;
        // print(response.body);
// Convert the JSON string to a Dart map
//         Map<String, dynamic> responseMap = json.decode(responseBody);

// // Access the token from the map
//         String token = responseMap['resetTokenData']['token'];
//         token1 = token;

// // Print or use the token as needed
//         print('Token: $token1');
//         saveTokenToLocal(token);
        // print(response.body);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreateNewPasswordPage()));
        // Handle success, you can parse the response if needed
      } else {
        print(
            'Failed to verify reset token. Status code: ${response.statusCode}');
        // Handle failure, you can check response.body for more details
      }
    } catch (error) {
      print('Error occurred during reset token verification: $error');
      // Handle other errors
    }
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
                Code = _submitCode();
                verifyResetToken(Code!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
