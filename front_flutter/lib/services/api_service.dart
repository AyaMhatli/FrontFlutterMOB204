import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:front_flutter/models/user.dart';
import 'package:front_flutter/models/queue.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class ApiService {
  static const String baseUrl = 'http://192.168.1.83:8000/api';
  static final _secureStorage = FlutterSecureStorage();

/* static Future<Map<String, dynamic>> login(String email, String password) async {
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
      print('Error in login: $e');
      throw Exception('Failed to connect to the server: $e');
    }
  }*/
 /*   logLas static Future<Map<String, dynamic>> login(String email, String password) async {
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
    

    final responseData = _processResponse(response);

    // Assuming the response contains a token
    final token = responseData['token'];
    if (token != null) {
     final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
    //   await _secureStorage.write(key: 'token', value: token);

    }

    return responseData;
  } catch (e) {
    print('Error in login: $e');
    throw Exception('Failed to connect to the server: $e');
  }
}
if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final token = responseData['token']; // Ensure this key matches your API response

        if (token != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('authToken', token);
        } else {
          throw Exception('Token is missing in the response');
        }

        return responseData;
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in login: $e');
      throw Exception('Failed to connect to the server: $e');
    }
  }*/




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

    if (response.statusCode == 200) {
      final responseData = _processResponse(response);

      // Ensure responseData is not null and contains a token
      if (responseData != null) {
        var token = responseData['token'];
        if (token != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('authToken', token);
          token = prefs.getString('token');
          print(token);
        }
      }

      return responseData ?? <String, dynamic>{};
    } else {
      print('Failed to login: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to login: ${response.statusCode}');
    }
  } catch (e) {
    print('Error in login: $e');
    throw Exception('Failed to connect to the server: $e');
  }
}




static Map<String, dynamic> _processResponse(http.Response response) {
    try {
      if (response.statusCode >= 200 )//&& response.statusCode < 300) 
      {
        // Attempt to decode the JSON response
        return jsonDecode(response.body);
      } else {
        // Handle error response
        print('Server error response: ${response.body}');
        final errorResponse = jsonDecode(response.body);
        throw Exception('Failed to load data: ${errorResponse['message']}');
      }
    } catch (e) {
      // Catch JSON decode error and print the response
      print('Error processing response: $e');
      print('Response body: ${response.body}');
      throw Exception('Unexpected response format: $e');
    }
  }
 static Future<Map<String, dynamic>> fetchData() async {
   final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');
       // final token = await _secureStorage.read(key: 'token');


    if (token == null) {
      throw Exception('Authentication token is missing');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/data'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    return _processResponse(response);
  }

  static Future<int> fetchNumeroActuelle() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('authToken');

      if (token == null) {
        throw Exception('Authentication token is missing');
      }
     // final response = await http.get(Uri.parse('$baseUrl/numero-actuelle'));
      
      
      final response = await http.get(
        Uri.parse('$baseUrl/numero-actuelle'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
      
      print('fetchNumeroActuelle response: ${response.body}');
      return _processResponse(response)['count'];
    } catch (e) {
      print('Error in fetchNumeroActuelle: $e');
      throw Exception('Failed to connect to the server: $e');
    }
  }

  static Future<int> fetchAppelTraites() async {
    try {
       final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('authToken');

      if (token == null) {
        throw Exception('Authentication token is missing');
      }

     /* final response = await http.get(
        Uri.parse('$baseUrl/appel-traites'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );*/

      final response = await http.get(Uri.parse('$baseUrl/appel-traites'));
    
      print('fetchAppelTraites response: ${response.body}');
      
      return _processResponse(response)['count'];
   
    } catch (e) {
      print('Error in fetchAppelTraites: $e');
      throw Exception('Failed to connect to the server: $e');
    }
  }

  static Future<int> fetchAppelNonTraites() async {
    try {
       final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('authToken');

      if (token == null) {
        throw Exception('Authentication token is missing');
      }
      //final response = await http.get(Uri.parse('$baseUrl/appel-non-traites'));
     final response = await http.get(
        Uri.parse('$baseUrl/appel-non-traites'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
    
      print('fetchAppelNonTraites response: ${response.body}');
      return _processResponse(response)['count'];
    } catch (e) {
      print('Error in fetchAppelNonTraites: $e');
      throw Exception('Failed to connect to the server: $e');
    }
  }

  /*static Future<Map<String, dynamic>> getAuthenticatedUser() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/user'),
        headers: <String, String>{
          'Authorization': 'Bearer YOUR_ACCESS_TOKEN', // Replace with actual token
        },
      );
      print('getAuthenticatedUser response: ${response.body}');
      return _processResponse(response);
    } catch (e) {
      print('Error in getAuthenticatedUser: $e');
      throw Exception('Failed to connect to the server: $e');
    }
  }
*/
static Future<Map<String, dynamic>> getAuthenticatedUser() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');

    if (token == null) {
      throw Exception('Authentication token is missing');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/user'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    print('getAuthenticatedUser response: ${response.body}');
    return _processResponse(response);
  } catch (e) {
    print('Error in getAuthenticatedUser: $e');
    throw Exception('Failed to connect to the server: $e');
  }
}
  
  
}
