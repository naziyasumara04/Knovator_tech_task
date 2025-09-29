import 'package:flutter/material.dart';
import 'package:knovator_tech_task/data/model/post.dart';
import '../../data/api/api_service.dart';

class PostDetailScreen extends StatefulWidget {
  final int postId;

  const PostDetailScreen({super.key, required this.postId});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final ApiService apiService = ApiService();
  late Future<Post> postFuture;

  @override
  void initState() {
    super.initState();
    postFuture = apiService.fetchPostDetail(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post Detail")),
      body: FutureBuilder<Post>(
        future: postFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No detail found"));
          }

          final post = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              post.body.toString(),
              style: const TextStyle(fontSize: 18),
            ),
          );
        },
      ),
    );
  }
}



