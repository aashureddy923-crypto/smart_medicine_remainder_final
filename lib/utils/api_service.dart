// Experiment 9: REST API Integration, HTTP GET Request, and JSON Parsing
import 'dart:convert';
import 'package:http/http.dart' as http;

class HealthTip {
  final int id;
  final String title;
  final String body;

  HealthTip({
    required this.id,
    required this.title,
    required this.body,
  });

  factory HealthTip.fromJson(Map<String, dynamic> json) {
    return HealthTip(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}

class ApiService {
  static const String endpoint = 'https://jsonplaceholder.typicode.com/posts?_limit=5';

  static Future<List<HealthTip>> fetchHealthTips() async {
    try {
      final response = await http.get(Uri.parse(endpoint));

      if (response.statusCode == 200) {
        // jsonDecode converts response body String into Dart dynamic object/List
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((item) => HealthTip.fromJson(item)).toList();
      } else {
        throw Exception("Server returned HTTP error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network request failed: $e");
    }
  }
}
