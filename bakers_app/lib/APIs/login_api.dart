import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> loginUser({
  required String url,
  required String email,
  required String password,
}) async {
  final data = {
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
