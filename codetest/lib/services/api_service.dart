import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:codetest/models/launch.dart';

// 範例中只有一個API所以就不特別去分類
class ApiService {
  final String baseUrl = 'https://api.spacexdata.com/v3';

  // TODO: 未來需要可以調整一下services結構
  Future<List<Launch>> fetchLaunches() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/launches'));
      if (response.statusCode == 200) {
        final List<dynamic> launchesJson = json.decode(response.body);
        debugPrint('Response: ${response.body}');

        return launchesJson
            .map((json) {
              try {
                return Launch.fromJson(json);
              } catch (e) {
                debugPrint('Error parsing launch: $e');
                debugPrint('Problematic JSON: $json');
                return null;
              }
            })
            .whereType<Launch>()
            .toList();
      } else {
        throw Exception('Failed to load launches: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching launches: $e');
      rethrow;
    }
  }
}
