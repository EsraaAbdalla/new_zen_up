// // ignore_for_file: avoid_print

// import 'dart:async';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class AudioBloc extends Cubit<List<AudioData>> {
//   AudioBloc() : super([]);

//   Future<dynamic> getAudiosByCategory(String categoryName) async {
//     final String baseUrl =
//         'https://meditation-0gig.onrender.com'; // Replace with your web server base URL
//     try {
//       final response =
//           await http.get(Uri.parse('$baseUrl/getAudiosByCat/$categoryName'));
//       if (response.statusCode == 200) {
//         final List<dynamic> jsonResponse = json.decode(response.body);
//         // final audioDataList =
//         // jsonResponse.map((data) => AudioData.fromJson(data)).toList();
//         List audioDataList = jsonResponse;

//         emit(audioDataList as List<AudioData>);
//         print(audioDataList);
//         return (audioDataList as List<AudioData>);
//       } else {
//         throw Exception('Failed to load audio data');
//       }
//     } catch (e) {
//       emit([]); // Reset the state in case of an error
//     }
//   }
// }

// class AudioData {
//   final String id;
//   final String name;
//   final String description;
//   final int length;
//   final String path;

//   AudioData({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.length,
//     required this.path,
//   });

//   factory AudioData.fromJson(Map<String, dynamic> json) {
//     return AudioData(
//       id: json['_id'],
//       name: json['name'],
//       description: json['description'],
//       length: json['length'],
//       path: json['path'],
//     );
//   }
// }
