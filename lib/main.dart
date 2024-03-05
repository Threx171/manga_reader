import 'package:flutter/material.dart';
import 'layout_sidebar.dart';
import 'layout_library.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: const Color(0xFF1E1E2C),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Manga Reader'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    LayoutLibrary(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData.dark().colorScheme.background,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.download), label: 'Downloads'),
          BottomNavigationBarItem(
              icon: Icon(Icons.extension), label: 'Extensions'),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color.fromARGB(255, 57, 118, 209),
        onTap: _onItemTapped,
        backgroundColor: const Color(0xFF1E1E2C),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
