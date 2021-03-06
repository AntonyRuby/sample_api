import 'package:flutter/material.dart';
import 'package:sample_api/screen/bible_screen/bible_screen.dart';
import 'package:sample_api/screen/get_users_screen/get_users_screen.dart';
import 'package:sample_api/screen/post_api_screen.dart/post_api_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostApiScreen(),
    );
  }
}
