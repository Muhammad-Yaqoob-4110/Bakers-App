import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> signupUser({
  required String url,
  required String username,
  required String email,
  required String password,
}) async {
  final data = {
    "username": username,
    "email": email,
    "password": password,
  };

  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode(data),
  );

  final responseData = json.decode(response.body);
  return responseData;
}
