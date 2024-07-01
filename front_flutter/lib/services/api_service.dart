/*import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    return _processResponse(response);
  }

 static Future<int> fetchNumeroActuelle() async {
    final response = await http.get(Uri.parse('$baseUrl/numero-actuelle'));
    return _processResponse(response)['count'];
  }

  static Future<int> fetchAppelTraites() async {
    final response = await http.get(Uri.parse('$baseUrl/appel-traites'));
    return _processResponse(response)['count'];
  }

  static Future<int> fetchAppelNonTraites() async {
    final response = await http.get(Uri.parse('$baseUrl/appel-non-traites'));
    return _processResponse(response)['count'];
  }

  static Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Failed to load data: ${errorResponse['message']}');
    }
  }
}*/
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000/api'; // Changez l'adresse IP si nécessaire

  static Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      return _processResponse(response);
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  static Future<int> fetchNumeroActuelle() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/numero-actuelle'));
      return _processResponse(response)['count'];
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  static Future<int> fetchAppelTraites() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/appel-traites'));
      return _processResponse(response)['count'];
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  static Future<int> fetchAppelNonTraites() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/appel-non-traites'));
      return _processResponse(response)['count'];
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  static Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception('Failed to load data: ${errorResponse['message']}');
    }
  }
}

