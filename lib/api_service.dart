import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com'; // Ganti dengan URL backend Anda

  Future<http.Response> createPost(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return response;
  }

  Future<http.Response> getPost(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/posts/$id'));
    return response;
  }

  Future<http.Response> getAllPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    return response;
  }
}
