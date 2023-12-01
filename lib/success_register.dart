// ignore_for_file: use_full_hex_values_for_flutter_colors, avoid_print, prefer_const_declarations

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:new_zen_up/original_page.dart';
import 'package:http/http.dart' as http;
import 'package:new_zen_up/shareed_preferences.dart';

String userName = 'Loading...'; // Initial value while fetching

class SuccessRegister extends StatefulWidget {
  const SuccessRegister({super.key});

  @override
  State<SuccessRegister> createState() => _SuccessRegisterState();
}

class _SuccessRegisterState extends State<SuccessRegister> {
  Future<void> fetchUserName() async {
    try {
      final String apiUrl =
          'https://meditation-0gig.onrender.com/auth/user-name';

      // Retrieve the access token from local storage
      final String? accessToken = await getTokenFromLocal();

      if (accessToken == null) {
        print('Access token not found.');
        // Handle the case where the access token is not available
        return;
      }

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        // Parse and use the response as needed
        final Map<String, dynamic> responseData = json.decode(response.body);
        String fetchedUserName = responseData['user'];
        print(fetchedUserName);
        setState(() {
          userName = fetchedUserName;
        });
      } else {
        print('Failed to fetch user name. Status code: ${response.statusCode}');
        // Handle failure, you can check response.body for more details
      }
    } catch (error) {
      print('Error occurred during user name fetch: $error');
      // Handle other errors
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserName(); // Initial fetch when the widget is created
  }

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
            Text(
              "Welcome,  $userName",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
