import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Manga {
  String title;
  String author;
  String description;
  ImageProvider cover;
  List<String> genres;
  List<String> chapters;

  Manga({
    required this.title,
    required this.author,
    required this.description,
    required this.cover,
    required this.genres,
    required this.chapters,
  });
}
