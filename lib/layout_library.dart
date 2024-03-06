import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appData.dart';
import 'requests.dart';

class LayoutLibrary extends StatefulWidget {
  const LayoutLibrary({Key? key}) : super(key: key);

  @override
  _LayoutLibraryState createState() => _LayoutLibraryState();
}

class _LayoutLibraryState extends State<LayoutLibrary> {
  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.background.withOpacity(0.6),
      body: appData.library.isNotEmpty
          ? GridView.count(
              crossAxisCount: 6,
              childAspectRatio: 0.8,
              crossAxisSpacing: 3.5, // Number of columns in the grid
              children: [
                for (var manga in appData.library)
                  // List of items in the grid
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onSecondaryTapDown: (details) =>
                          appData.showContextMenu(context, details, manga),
                      onTap: () {
                        appData.downloadMangaCover('Bleach', manga);
                        // Add your action here
                      },
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          AspectRatio(
                            aspectRatio: 8 /
                                10, // replace with the aspect ratio of your manga cover
                            child: Image(image: manga.cover, fit: BoxFit.cover),
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.black.withOpacity(0.5),
                            child: Text(
                              manga.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), // Add more items as needed
              ],
            )
          : Center(
              child: Text('No items yet'),
            ),
    );
  }
}
