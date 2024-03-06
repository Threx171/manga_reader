import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appData.dart';

class LayoutFavorites extends StatefulWidget {
  const LayoutFavorites({Key? key}) : super(key: key);

  @override
  _LayoutFavoritesState createState() => _LayoutFavoritesState();
}

class _LayoutFavoritesState extends State<LayoutFavorites> {
  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);
    return Scaffold(
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.6),
        body: appData.favorites.isNotEmpty
            ? GridView.count(
                crossAxisCount: 6,
                childAspectRatio: 0.8,
                crossAxisSpacing: 3.5,
                children: [
                    for (var manga in appData.favorites)
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onSecondaryTapDown: (details) =>
                              appData.showContextMenu(context, details, manga),
                          onTap: () {
                            print('${manga.title} tapped');
                            // Add your action here
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              AspectRatio(
                                aspectRatio: 8 / 10,
                                child: Image(
                                    image: manga.cover, fit: BoxFit.cover),
                              ),
                              Container(
                                width: double.infinity,
                                color: Colors.black.withOpacity(0.5),
                                child: Text(
                                  manga.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ])
            : Center(
                child: Text('No favorites yet'),
              ));
  }
}
