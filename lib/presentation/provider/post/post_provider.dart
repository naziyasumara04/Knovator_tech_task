import 'package:flutter/foundation.dart';
import '../../../data/model/post.dart';

class PostProvider extends ChangeNotifier {

  List<Post> posts = [];
  Set<int> readPosts = {}; // store IDs of read posts

  void setPosts(List<Post> newPosts) {
    posts = newPosts;
    notifyListeners();
  }

  void markAsRead(int postId) {
    readPosts.add(postId);
    notifyListeners();
  }

  bool isRead(int postId) {
    return readPosts.contains(postId);
  }
}


