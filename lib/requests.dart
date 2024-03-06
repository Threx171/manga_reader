import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Requests {
  Requests(this.url);
  final String url;

  static Future getMangaJSON(String title) async {
    http.Response response = await http
        .get(Uri.parse('https://api.mangadex.org/manga?title=$title'));
    if (response.statusCode == 200) {
      var manga = jsonDecode(response.body);
      return manga;
    } else {
      print('Failed to load manga');
    }
  }

  static Future getMangaCover(String id, String title) async {
    http.Response response = await http.get(
        Uri.parse('https://api.mangadex.org/cover?limit=10&manga%5B%5D=$id'));
    if (response.statusCode == 200) {
      var cover = jsonDecode(response.body);
      print(cover);
      if (cover != null) {
        print(cover['data'][0]['attributes']['fileName']);
        http.Response response = await http.get(Uri.parse(
            'https://uploads.mangadex.org/covers/$id/${cover['data'][0]['attributes']['fileName']}'));
        if (response.statusCode == 200) {
          print('Cover loaded');
          var filePath = 'images/$title' + '_cover.jpg';
          var file = File(filePath);
          await file.writeAsBytes(response.bodyBytes);
          return filePath;
        }
      } else {
        print('Failed to load cover');
      }
    }
  }
}
