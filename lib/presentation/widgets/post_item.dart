import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/model/post.dart';
import '../provider/post/post_provider.dart';
import '../screens/post_detail_screen.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    final isRead = postProvider.isRead(post.id ?? 0);

    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 2),
          decoration: BoxDecoration(
            color: isRead ? Colors.white : Colors.yellow[100],
          ),

          child: ListTile(
            title: Text(post.title.toString()),
            trailing: isRead
                ? const Icon(Icons.check_circle, color: Colors.green)
                : null,
            onTap: () {
              final postId = post.id ?? 0; // fallback to 0 if null
              if (postId != 0) {
                postProvider.markAsRead(postId);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PostDetailScreen(postId: postId),
                  ),
                );
              } else {
                print("⚠️ Post ID is null, cannot open detail screen");
              }
            },
            // onTap: () {
            //   postProvider.markAsRead(post.id ?? 0);
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (_) => PostDetailScreen(postId: post.id ?? 0),
            //     ),
            //   );
            // },
          ),
        ),
      ],
    );
  }
}
