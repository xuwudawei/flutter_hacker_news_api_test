import 'package:flutter/material.dart';
import 'package:news_api_app/providers/commentProvider.dart';
import 'package:news_api_app/providers/storyProvider.dart';
import 'package:news_api_app/screens/newsHomePage.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CommentProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const NewsHomePage(),
      ),
    );
  }
}
