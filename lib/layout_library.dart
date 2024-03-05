import 'package:flutter/material.dart';

class LayoutLibrary extends StatefulWidget {
  const LayoutLibrary({Key? key}) : super(key: key);

  @override
  _LayoutLibraryState createState() => _LayoutLibraryState();
}

class _LayoutLibraryState extends State<LayoutLibrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.background.withOpacity(0.6),
      body: GridView.count(
        crossAxisCount: 6,
        childAspectRatio: 0.8,
        mainAxisSpacing: 0.5,
        crossAxisSpacing: 5.5, // Number of columns in the grid
        children: [
          // List of items in the grid
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                print('Item 1 tapped');
                // Add your action here
              },
              child: Image.asset('images/item1.jpg', fit: BoxFit.cover),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                print('Item 2 tapped');
                // Add your action here
              },
              child: Image.asset('images/item2.jpg', fit: BoxFit.cover),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                print('Item 3 tapped');
                // Add your action here
              },
              child: Image.asset('images/item3.jpg', fit: BoxFit.cover),
            ),
          ),
          // Add more items as needed
        ],
      ),
    );
  }
}
