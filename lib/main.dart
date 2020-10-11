import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/allNews_screen.dart';
import 'package:flutter_news_app/screens/new_article_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: News(),
      routes: {
        'news': (context)=> new News(),
        'articleDetails': (context)=> new ArticleDetails("","","","","","",""),
      },
    );
  }
}
