import 'dart:convert';
import '../model/post.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        "Accept": "application/json",
        "User-Agent": "FlutterApp", // avoid rejection
      },
    );

    print("➡️ Requesting: $baseUrl");
    print("⬅️ Status: ${response.statusCode}");
    print("⬅️ Headers: ${response.headers}");
    print("⬅️ Body: ${response.body}");

    try {
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data.map((e) => Post.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load posts");
      }
    } catch (e) {
      throw Exception("Failed to load posts, code: ${response.statusCode}");
    }
  }

  Future<Post> fetchPostDetail(int id) async {
    final response = await http.get(
      Uri.parse("$baseUrl/$id"),
      headers: {
        "Accept": "application/json",
        "User-Agent": "FlutterApp", // avoid rejection
      },
    );

    try {
      if (response.statusCode == 200) {
        return Post.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load post detail');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Something went wrong');
    }
  }
}
