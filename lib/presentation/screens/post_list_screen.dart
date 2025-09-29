import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/api/api_service.dart';
import '../provider/post/post_provider.dart';
import '../widgets/post_item.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  // void _loadPosts() async {
  //   final posts = await apiService.fetchPosts();
  //   Provider.of<PostProvider>(context, listen: false).setPosts(posts);
  // }


  void _loadPosts() async {
    try {
      final posts = await apiService.fetchPosts();
      print("Fetched ${posts.length} posts"); //check if API returns data
      Provider.of<PostProvider>(context, listen: false).setPosts(posts);
    } catch (e) {
      print("Error fetching posts: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          final posts = postProvider.posts;

          if (posts.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return PostItem(post: posts[index]); // reusable widget
            },
          );
        },
      ),
    );
  }
}



