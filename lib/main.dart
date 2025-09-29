import 'package:flutter/material.dart';
import 'package:knovator_tech_task/presentation/provider/post/post_provider.dart';
import 'package:knovator_tech_task/presentation/screens/post_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => PostProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: PostListScreen(),
    );
  }
}
