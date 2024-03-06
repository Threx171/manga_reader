import 'package:flutter/material.dart';
import 'manga.dart';
import 'requests.dart';

class AppData with ChangeNotifier {
  // Access appData globaly with:
  // AppData appData = Provider.of<AppData>(context);
  // AppData appData = Provider.of<AppData>(context, listen: false)

  List<Manga> favorites = [];
  List<Manga> library = [
    Manga(
      title: 'Manga 1',
      author: 'Author 1',
      description: 'Description 1',
      cover: AssetImage('images/item1.jpeg'),
      genres: ['Action', 'Adventure', 'Fantasy'],
      chapters: ['Chapter 1', 'Chapter 2', 'Chapter 3'],
    ),
  ];

  Future downloadMangaCover(String title, Manga manga) async {
    dynamic manga = await Requests.getMangaJSON(title);
    if (manga != null) {
      print(manga['data'][0]['relationships'][2]['id']);
      dynamic cover =
          await Requests.getMangaCover(manga['data'][0]['id'], title);
      if (cover != null) {
        return cover;
      }
    }
  }

  void showContextMenu(
      BuildContext context, TapDownDetails details, Manga manga) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx,
        details.globalPosition.dy,
      ),
      items: [
        PopupMenuItem(
          child: Text('Read'),
          value: 'read',
        ),
        PopupMenuItem(
          child: Text('Favorite'),
          value: 'favorite',
        ),
        PopupMenuItem(
          child: Text('Delete'),
          value: 'delete',
        ),
      ],
    ).then((value) {
      if (value == 'read') {
        print('Read item 1');
        // Add your action here
      } else if (value == 'favorite') {
        favorites.add(manga);
      } else if (value == 'delete') {
        print('Delete item 1');
        // Add your action here
      }
    });
  }
}
