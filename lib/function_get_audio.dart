// // ignore_for_file: prefer_const_declarations, avoid_print

// import 'package:http/http.dart' as http;
// import 'dart:convert';

// Future<List<Map<String, dynamic>>?> fetchAudiosByCategory(
//     String categoryName) async {
//   final String baseUrl = 'https://meditation-0gig.onrender.com'; // Repl
//   final response =
//       await http.get(Uri.parse('$baseUrl/getAudiosByCat/$categoryName'));

//   if (response.statusCode == 200) {
//     final List<dynamic> jsonResponse = json.decode(response.body);
//     return jsonResponse.cast<Map<String, dynamic>>();
//   } else {
//     print('Failed to load audio data');
//     return []; // Return an empty list in case of an error
//   }
// }
