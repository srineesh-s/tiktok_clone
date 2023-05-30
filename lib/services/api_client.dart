import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  Future<Map<String, dynamic>> getResponse(String baseUrl, String route) async {
    final url = baseUrl + route;
    try {
      final resp2 = await http.get(Uri.parse(url));
      return jsonDecode(resp2.body);
    } catch (e) {
      throw Exception();
    }
  }
}
