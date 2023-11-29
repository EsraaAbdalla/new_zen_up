// ignore_for_file: prefer_const_declarations, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_zen_up/shareed_preferences.dart';

String? fetchedpreviousAudio;
Future<void> fetchPreviousAudio() async {
  try {
    final String apiUrl = 'https://meditation-0gig.onrender.com/previous-audio';

    // Retrieve the access token from local storage
    final String? accessToken = await getTokenFromLocal();

    if (accessToken == null) {
      print(
          'Access token not found. Please log in.'); // Handle the case where the access token is not available
      // You might want to navigate to the login screen or take other actions here
      return;
    }

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      print("Done");
      // Check if the response body is not null
      final Map<String, dynamic> previousAudioList = json.decode(response.body);
      print(previousAudioList);
      fetchedpreviousAudio = previousAudioList['perviousMixLink'];
      print(fetchedpreviousAudio);
    } else {
      print(
          'Failed to fetch previous audio. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      // Handle failure, you can check response.body for more details
    }
  } catch (error) {
    print('Error occurred during previous audio fetch: $error');
    // Handle other errors
  }
}
