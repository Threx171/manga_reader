import 'package:flutter/material.dart';

import 'layout_desktop.dart';

// Main application widget
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manga Reader',
      theme: ThemeData(
        canvasColor: const Color(0xFF1E1E2C),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Manga Reader'),
    );
  }
}
